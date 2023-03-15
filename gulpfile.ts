import { exec } from 'child_process'
import { existsSync } from 'fs'
import fs from 'fs/promises'
import { dest, lastRun, parallel, series, src, watch } from 'gulp'
import path from 'path'
import sharp from 'sharp'
import { Transform, TransformCallback, TransformOptions } from 'stream'
import Vinyl from 'vinyl'

export const clean = async () => {
    if (existsSync('build')) {
        await fs.rm('build', { recursive: true })
    }
}

export const fonts = () =>
    src('fonts/**/*', { since: lastRun(fonts) }).pipe(dest('build/fonts'))

class CompressImagesTransform extends Transform {
    constructor(opts?: TransformOptions) {
        super({
            ...opts,
            objectMode: true
        })
    }

    _transform(
        srcVinyl: Vinyl,
        encoding: BufferEncoding,
        callback: TransformCallback
    ): void {
        if (srcVinyl.contents instanceof Buffer) {
            sharp(srcVinyl.contents)
                .toFormat('jpg', { mozjpeg: true })
                .toBuffer((err, result, info) => {
                    if (err) {
                        callback(err)
                    } else {
                        const { dir, name } = path.parse(srcVinyl.path)
                        callback(
                            null,
                            new Vinyl({
                                base: srcVinyl.base,
                                cwd: srcVinyl.cwd,
                                path: path.join(dir, name + '.jpg'),
                                history: [...srcVinyl.history],
                                contents: result
                            })
                        )
                    }
                })
        } else {
            callback(new Error('vinyl.contents is not a buffer'))
        }
    }
}

export const images = async () => {
    return src('images/*', { since: lastRun(images) })
        .pipe(new CompressImagesTransform())
        .pipe(dest('build/images'))
}

export const js = () => exec('npx babel js -d build')

export const prettier = () => exec('npx prettier -w build')

export const ssg = () => {
    const child = exec('ssg-0.1.0/bin/ssg --info build')
    child.stdout?.pipe(process.stdout)
    child.stderr?.pipe(process.stderr)
    return child
}

export const style = () => exec('npx sass style:build')

export const build = series(parallel(fonts, images, js, ssg, style), prettier)

export const dev = async () => {
    watch('fonts/**/*', { ignoreInitial: false }, fonts)
    watch('images/**/*', { ignoreInitial: false }, images)
    watch('js/**/*', { ignoreInitial: false }, js)
    watch(
        ['parts/**/*', 'specialPages/**/*', 'templates/**/*', 'texts/**/*'],
        { ignoreInitial: false },
        series(ssg, prettier)
    )
    watch('style/**/*', { ignoreInitial: false }, series(style, prettier))
}

import { exec } from 'child_process'
import { existsSync } from 'fs'
import fs from 'fs/promises'
import { dest, parallel, series, src } from 'gulp'
import sharp from 'sharp'
import { Transform, TransformCallback, TransformOptions } from 'stream'
import Vinyl from 'vinyl'

export const clean = async () => {
    if (existsSync('build')) {
        await fs.rm('build', { recursive: true })
    }
}

export const fonts = () => src('fonts/**/*').pipe(dest('build/fonts'))

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
                        callback(
                            null,
                            new Vinyl({
                                base: srcVinyl.base,
                                cwd: srcVinyl.cwd,
                                path: srcVinyl.path,
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
    return src('images/*')
        .pipe(new CompressImagesTransform())
        .pipe(dest('build/images'))
}

export const js = () => exec('npx babel js -d build')

export const prettier = () => exec('npx prettier -w build')

export const ssg = () => {
    const child = exec('ssg-0.1.0/bin/ssg --info build')
    child.stdout?.pipe(process.stdout)
    return child
}

export const style = () => exec('npx sass style:build')

export const build = series(parallel(fonts, images, ssg, style), prettier, js)

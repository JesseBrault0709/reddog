<head>
    <meta charset="utf-8" />

    <meta name="author" content="${ binding.author ?: globals.siteAuthor }" />
    <meta name="description" content="${ binding.description }" />

    <%
        if (binding.og) {
            out << tagBuilder.meta(property: 'og:url', content: globals.baseUrl + '/' + binding.path)
            out << tagBuilder.meta(property: 'og:title', content: binding.og.title)
            out << tagBuilder.meta(property: 'og:description', content: binding.og.description)

            if (binding.og.image) {
                out << tagBuilder.meta(property: 'og:image', content: binding.og.image)
                if (!binding.og.imageWidth || !binding.og.imageHeight) {
                    throw new IllegalArgumentException('og.imageWidth and og.imageHeight are required.')
                }
                out << tagBuilder.meta(property: 'og:image:width', content: binding.og.imageWidth)
                out << tagBuilder.meta(property: 'og:image:height', content: binding.og.imageHeight)
            }
        }
    %>

    <title>$binding.pageTitle</title>
</head>
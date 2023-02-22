<%
    def fixDescription = { description ->
        description.replaceAll('"', "'")
    }
%>

<head>
    <meta charset="utf-8" />

    <meta name="author" content="${ binding.author ?: globals.siteAuthor }" />
    <meta name="description" content="${ fixDescription(binding.description) }" />

    <%
        if (binding.og) {
            out << tagBuilder.meta(property: 'og:url', content: urlBuilder.absolute)
            out << tagBuilder.meta(property: 'og:title', content: binding.og.title)
            out << tagBuilder.meta(property: 'og:description', content: fixDescription(binding.og.description))

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

    <link rel="stylesheet" href="${ urlBuilder.relative('main.css') }" />
    <link rel="stylesheet" href="${ urlBuilder.relative('fonts/computer_modern_sans/cmun-sans.css') }" />
    <link rel="stylesheet" href="${ urlBuilder.relative('fonts/computer_modern_serif/cmun-serif.css') }" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond&display=swap" rel="stylesheet">
</head>
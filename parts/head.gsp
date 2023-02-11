<head>
    <meta charset="utf-8" />

    <meta name="author" content="${ binding.author }" />
    <meta name="description" content="${ binding.description }" />

    <meta property="og:url" content="${ globals.baseUrl + '/' + binding.path }" />
    <meta property="og:title" content="${ binding.ogTitle }" />
    <meta property="og:description" content="${ binding.description }" />

    <%
        if (binding.ogImage) {
            out << '<meta property="og:image" content="' + binding.ogImage + '" />'
            if (!binding.ogImageWidth || !binding.ogImageHeight) {
                throw new IllegalArgumentException('ogImageWidth and ogImageHeight are required.')
            }
            out << '<meta property="og:image:width" content="' + binding.ogImageWidth + '" />'
            out << '<meta property="og:image:height" content="' + binding.ogImageHeight + '" />'
        }
    %>

    <title>$binding.pageTitle</title>
</head>
<%
    out << parts['head.gsp'].render([
        author: binding.author,
        description: binding.description,
        extraStyles: [
            'bio.css'
        ],
        pageTitle: binding.pageTitle,
        og: [
            description: binding.description,
            title: binding.ogTitle
        ]
    ])

    def content = texts.findAll { it.path.startsWith(binding.textsPath) }
            .sort { t0, t1 -> t0.path <=> t1.path }
            .collect { text ->
                def fullPath = tasks.findAllByType(taskTypes.textToHtmlFile).find {
                    it.input.path == text.path
                }?.output?.htmlPath

                if (fullPath == null) {
                    throw new NullPointerException("could not find a matching fullPath for ${ text.path }")
                } else {
                    return parts['bio/excerpt.gsp'].render([
                        text: text,
                        fullPath: fullPath
                    ])
                }
            }.join('\n')

    out << parts['body.gsp'].render([
        content: content
    ])
%>
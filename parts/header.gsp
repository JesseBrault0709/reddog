<%
    /** 
     * TODO: find a better way to ascertain the taskType
     *
     * @param inputPath the path of the input file we are finding a url for; eg: 'index.md'.
     * @return a relative url to the htmlPath of the input
     */
    def getNavButtonUrl = { inputPath ->
        def taskType = inputPath.endsWith('.md') ?
            taskTypes.textToHtmlFile :
            inputPath.endsWith('.gsp') ?
                taskTypes.specialPageToHtmlFile :
                null

        if (taskType == null) {
            throw new IllegalArgumentException("cannot find taskType for inputPath ${ inputPath }")
        }

        def htmlPath = tasks.findAllByType(taskType).find {
            it.input.path == inputPath
        }?.output?.htmlPath

        if (htmlPath == null) {
            throw new NullPointerException("cannot get htmlPath for ${ inputPath }")
        }

        urlBuilder.relative(htmlPath)
    }

    def makeNavButton = { name, inputPath ->
        def a = tagBuilder.a([href: getNavButtonUrl(inputPath)], name)
        tagBuilder.li a
    }
%>
<header>
    <h1>$globals.siteTitle</h1>
    <nav id="main-nav">
        <div id="main-nav-hamburger-container">
            <span id="main-nav-hamburger-label">Menu</span>
            <button id="main-nav-hamburger-button">
                <span class="material-symbols-outlined">menu</span>
            </button>
        </div>
        <ul id="main-nav-ul">
            <%
                def navButtons = [
                    makeNavButton('About', 'index.md'),
                    makeNavButton('The Album', 'album.gsp'),
                    makeNavButton('The Composers', 'composers.gsp'),
                    makeNavButton('The Musicians', 'musicians.gsp'),
                    makeNavButton('Contact', 'contact.gsp')
                ]
                out << navButtons.join('\n')
            %>
        </ul>
    </nav>
</header>
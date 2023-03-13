window.addEventListener('load', () => {
    const hamburgerContainer = document.getElementById(
        'main-nav-hamburger-container'
    )
    const hamburgerButton = document.getElementById('main-nav-hamburger-button')
    const ul = document.getElementById('main-nav-ul')

    let menuOpen = false

    const mediaQuery = window.matchMedia('(max-width: 699px)')

    const setNavClasses = () => {
        if (mediaQuery.matches) {
            hamburgerContainer.classList.remove('hide')
            hamburgerContainer.classList.add('show')
            if (menuOpen) {
                ul.classList.remove('hide')
                ul.classList.add('show')
            } else {
                ul.classList.remove('show')
                ul.classList.add('hide')
            }
        } else {
            menuOpen = false
            hamburgerContainer.classList.remove('show')
            hamburgerContainer.classList.add('hide')
            ul.classList.remove('hide')
            ul.classList.add('show')
        }
    }

    hamburgerButton.addEventListener('click', () => {
        menuOpen = !menuOpen
        setNavClasses()
    })

    mediaQuery.addEventListener('change', setNavClasses)

    setNavClasses()
})

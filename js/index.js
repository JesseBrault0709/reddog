window.addEventListener('DOMContentLoaded', () => {
    const hamburgerContainer = document.getElementById(
        'main-nav-hamburger-container'
    )
    const hamburgerButton = document.getElementById('main-nav-hamburger-button')
    const hamburgerSpan = document.getElementById('main-nav-hamburger-span')
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
                hamburgerSpan.innerText = 'close'
            } else {
                ul.classList.remove('show')
                ul.classList.add('hide')
                hamburgerSpan.innerText = 'menu'
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

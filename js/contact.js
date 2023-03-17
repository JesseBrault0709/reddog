window.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('contact-form')

    const nameError = document.getElementById('contact-form-name-error')
    const emailError = document.getElementById('contact-form-email-error')
    const messageError = document.getElementById('contact-form-message-error')
    const submitMessage = document.getElementById('contact-form-submit-message')

    const showErrors = () => {
        ;[nameError, emailError, messageError].forEach(e => {
            e.classList.remove('hide')
            e.classList.add('show')
        })
    }

    const hideErrors = () => {
        ;[nameError, emailError, messageError].forEach(e => {
            e.classList.remove('show')
            e.classList.add('hide')
        })
    }

    const clearErrors = () => {
        ;[nameError, emailError, messageError].forEach(e => {
            e.innerHTML = '&nbsp;'
        })
    }

    const showSubmitMessageSuccess = () => {
        submitMessage.classList.remove('hide', 'failure')
        submitMessage.classList.add('show', 'success')
    }

    const showSubmitMessageFailure = () => {
        submitMessage.classList.remove('hide', 'success')
        submitMessage.classList.add('show', 'failure')
    }

    const hideSubmitMessage = () => {
        submitMessage.classList.remove('show')
        submitMessage.classList.add('hide')
    }

    const clearSubmitMesage = () => {
        submitMessage.innerHTML = '&nbsp;'
    }

    form.addEventListener('submit', event => {
        event.preventDefault()
        clearErrors()
        clearSubmitMesage()

        const formData = new FormData(form)
        const name = formData.get('name')
        const email = formData.get('email')
        const message = formData.get('message')

        let isValid = true

        if (name === null || name.trim() === '') {
            nameError.innerHTML = 'Name is required.'
            isValid = false
        }

        if (email === null || email.trim() === '' || !/.*@.*\..*/.test(email)) {
            emailError.innerHTML = 'A valid email is required.'
            isValid = false
        }

        if (message === null || message.trim() === '') {
            messageError.innerHTML = 'Message is required.'
            isValid = false
        }

        if (isValid) {
            const formatted = [
                `Name: ${name}`,
                `Email: ${email}`,
                `Message: ${message}`
            ].join('\n')

            console.log(formatted)

            fetch('https://api.jessebrault.com/contact/reddog', {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json'
                },
                body: JSON.stringify({
                    message: formatted
                })
            })
                .then(res => {
                    if (res.ok) {
                        submitMessage.innerHTML =
                            'Your message was sent successfully!'
                        showSubmitMessageSuccess()
                    } else {
                        submitMessage.innerHTML =
                            'Your message could not be sent. Please try again later.'
                        showSubmitMessageFailure()
                        console.error(
                            `Unable to send message; status: ${res.status}`
                        )
                    }
                })
                .catch(err => {
                    submitMessage.innerHTML =
                        'Your message could not be sent. Please try again later.'
                    showSubmitMessageFailure()
                    console.error(err)
                })
                .finally(() => {
                    setTimeout(() => {
                        hideSubmitMessage()
                    }, 4000)
                })
        } else {
            showErrors()

            setTimeout(() => {
                hideErrors()
            }, 4000)
        }
    })

    clearErrors()
    clearSubmitMesage()
})

const contactFormSubmitHandler = () => false

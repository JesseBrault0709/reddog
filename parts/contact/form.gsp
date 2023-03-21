<h1>Contact</h1>
<p class="contact-form-intro">Please use the following form to contact us.</p>
<p class="contact-form-intro">All fields are required!</p>
<form id="contact-form" onSubmit="contactFormSubmitHandler()">
    <div class="contact-form-control">
        <label for="name">Name</label>
        <input id="contact-form-name" name="name" />
        <span id="contact-form-name-error" class="contact-form-error"></span>
    </div>

    <div class="contact-form-control">
        <label for="email">Email</label>
        <input id="contact-form-email" name="email" type="email" />
        <span id="contact-form-email-error" class="contact-form-error"></span>
    </div>

    <div class="contact-form-control">
        <label for="message">Message</label>
        <textarea id="contact-form-message" name="message"></textarea>
        <span id="contact-form-message-error" class="contact-form-error"></span>
    </div>

    <div class="contact-form-control">
        <button id="contact-form-submit" type="submit">Send Message</button>
        <span id="contact-form-submit-message"></span>
    </div>
</form>

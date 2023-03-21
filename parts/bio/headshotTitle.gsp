<div class="headshot-title">
    <div class="title-and-role left-right-padded">
        <h2 class="title">$binding.title</h2>
        <h3 class="role">$binding.role</h3>
    </div>
    <%= 
        tagBuilder.img([
            src: urlBuilder.relative('images/' + binding.image),
            alt: "Headshot of ${ binding.title }",
            class: 'featured-image'
        ])
    %>
</div>
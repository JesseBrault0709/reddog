<div>
    <h2>$binding.title</h2>
    <h3>$binding.role</h3>
    <%= 
        tagBuilder.img([
            src: urlBuilder.relative('images/' + binding.image),
            alt: "Headshot of ${ binding.title }",
            width: binding.width ?: 600,
            height: binding.height ?: 400,
            class: 'featured-image'
        ])
    %>
</div>
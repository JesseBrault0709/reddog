<article>
    <h4>$binding.title</h4>
    <div>
        <span>$binding.date</span>
        <span>—</span>
        <span>$binding.author</span>
    </div>
    <p>
        $binding.excerpt <%= tagBuilder.a(href: binding.link, 'View More') %>
    </p>
</article>
<article id="cover">
    <img src="${ urlBuilder.relative('images/neonAndOakCover.jpg') }" alt="Cover of Neon and Oak" width="600" height="600" />
    <div>
        <% out << texts.find { it.path == 'album/cover.md'}.render() %>
    </div>
</article>

<article id="streaming">
    <p>Streaming and available for purchase now!</p>
    <div id="platforms">
        <a class="platform" href="https://open.spotify.com/album/4TvYhL0ni5885HgPBDrERc?si=I7LeCswMSeKwRNuxxeVwEw" target="_blank">
            <span class="platform-icon">
                <i class="fa-brands fa-spotify"></i>
            </span>
            <span class="text">Spotify</span>
        </a>

        <a class="platform" href="https://music.apple.com/de/album/neon-oak/1665784183" target="_blank">
            <span class="platform-icon">
                <i class="fa-brands fa-itunes"></i>
            </span>
            <span class="text">Apple Music</span>
        </a>

        <a class="platform" href="https://music.amazon.com/albums/B0BSG9WMY8" target="_blank">
            <span class="platform-icon">
                <i class="fa-brands fa-amazon"></i>
            </span>
            <span class="text">Amazon Music</span>
        </a>

        <a class="platform" href="https://www.youtube.com/watch?v=AkmIU4RTuwA&list=OLAK5uy_nrr-byAfk-AFK02YPr7EWxgcwW-kyqWkY" target="_blank">
            <span class="platform-icon">
                <i class="fa-brands fa-youtube"></i>
            </span>
            <span class="text">YouTube</span>
        </a>
    </div>
</article>

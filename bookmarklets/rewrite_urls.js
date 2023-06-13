javascript: (() => {
    const ul = document.getElementsByClassName('CHANGME')[0];
    links = ul.getElementsByTagName("a");

    for (let i = 0; i <= links.length - 1; i++) {
        old_link = links[i].href;
        new_link = old_link.replace('https://prefix.', 'https://prefix.new.').replace('.suffix.com', '.suffix.new.com');
        links[i].href = new_link;
    }

})();

# Systems Research Artifacts (sysartifacts)

The [sysartifacts website](https://sysartifacts.github.io/) hosts the artifact evaluation of multiple conferences.
While initially for SOSP'19, the website was generalized to also host the AEs for other systems conferences.
As part of the generalization we changed from static HTML pages to a Jekyll-rendered site.
This process is integrated into GitHub Pages.
This repository includes the sources for Jekyll to render the HTML pages.


## Contributing

Please fork the [GitHub repository](https://github.com/sysartifacts/sysartifacts.github.io),
make your changes, and submit them via a pull request.
In the PR please describe your changes and any reasons for the changes.
Once reviewed it will be merged and available on the sysartifacts website.

You have two options to preview changes: configure your forked repository on GitHub to use your
branch for GitHub Pages and view it at `your_username.github.io/sysartifacts.github.io`,
or install Jekyll and Bundler locally then run `bundle exec jekyll serve` at the root of the repository.


## Adding an additional conference

We welcome other systems conferences to join the efforts to make systems artifacts easily accessible.

To add a conference, copy the `.md` in `_conferences` from one of the existing conferences
(e.g. `osdi.md`) in the root folder to your conference name (e.g. `atc.md`).
This will lead to creating `atc.html` when rendered.
Adapt this page to your conference name by changing the title and text (e.g. change `OSDI` to `ATC`).


## Adding another year to an existing conference

Start from an existing conference year such as `eurosys2022`, by
copy-pasting its existing folder in `_conferences` to your new folder.
The folder name must be the exact conference name followed by the year such as `atc2022` for `atc` in `2022`.

Pages are in Kramdown ([cheat sheet](https://kramdown.gettalong.org/quickref.html)).

To change the order of items in the left sidebar, change the `order` property in the front matter.

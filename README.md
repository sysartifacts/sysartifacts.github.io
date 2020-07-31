# Systems Research Artifacts (sysartifacts)

Sysartifacts (https://sysartifacts-generalize.github.io/) hosts the artifact
evaluation of multiple conferences (EuroSys, OSDI, SOSP) . While started for
SOSP'19, the website was generalized to also host the AE's for EuroSys and OSDI.
As part of the generalization we changed from static HTML pages to a
Jekyll-rendered site. This process is integrated into github pages. This
repository includes the sources for Jekyll to render the html pages.

## Contributing to Sysartifacts

Please fork the [github
repository](https://github.com/sysartifacts/sysartifacts.github.io), make your
changes, and submit them via a pull request. In the PR please describe your
changes and any reasons for the change. Once reviewed it will be merged into the
master and available on the sysartifacts website.

## Adding another Artifact Evaluation year to an existing Conference

A conference already exists, if it is shown in the top menu and represented on
the main page. The goal of this section is to add a new AE of year X to this
conference. Exemplarily, we go through the process for EuroSys'22. Please follow
the following steps:

1. Add AE year to `_config.yml`

Change the conference specific configuration from:

``` yaml
- name: EuroSys
      ae:
        - year: 2021
          location: eurosys2022
```

To include the additional year:

``` yaml
- name: EuroSys
      ae:
        - year: 2021
          location: eurosys2022
        - year: 2022
          location: eurosys2022
```

The location points to the folder which includes the AE for the particular year
and conference.

2. Copy the `aetemplate` folder to `eurosys2022`

The `aetemplate` folder includes a set of standard files with work in
progress marks.

3. Alter the left hand menu for the AE year

Each file in `eurosys2022` includes a variable definition at the top. Part of
this definition is the sidebar. This sidebar is the left menu when you look at
another AE. The sidebar definition for the `aetemplate` points to confyeartoc as
seen below.

``` yaml
sidebar:
    title: 'Conf year'
    nav: confyeartoc
```

Simply change it to the desired conference. Here:

``` yaml
sidebar:
    title: 'EuroSys 2022'
    nav: eurosys2022toc
```

This changes the title of the sidebar, but and changes the contents to
`eurosys2022toc`. This table of contents (TOC) does not exist yet and hence, has
to be added to `_data/navigation.yml`. Again, simply copy paste from the
`confyeartoc` template and adjust the location and menu points.

``` yaml
eurosys2022toc:
  - title: 'Call for Artifacts'
    url: eurosys2022/index.html
  - title: 'Call for AEC Members'
    url: eurosys2022/aec-call.html
  - title: 'Available Badges'
    url: eurosys2022/badges.html
  - title: 'Committee'
    url: eurosys2022/committee.html
  - title: 'Results'
    url: eurosys2022/results.html
```

4. Writing the AE contents

Simply go to the `eurosys2022` folder and write in kramdown ([cheat
sheet](https://kramdown.gettalong.org/quickref.html)). Each `*.md` file will
result in one html file. You can simply link to it via `[linkname](target)` or
add it to the `eurosys2022toc` menu defined in `_data/navigation`.

## Adding an additional conference to sysartifacts

We welcome other system conferences to join the efforts to make systems
artifacts easily accessible.

To add a conference, please follow the following steps and submit a PR.

1. Add conference to `_config.yml`

The `conferences` variable in `_config.yml` describes the different conference
supported by sysartifacts. Simply add you conference to the list by changing the
following to inlcude your conference. Please add the conference in alphabetical
order.

``` yaml
conferences:
    - name: EuroSys
      ae:
        - year: 2021
          location: eurosys2021
```

To include ATC:

``` yaml
conferences:
    - name: ATC
      ae:
        - year: 2021
          location: atc2021
```

This automatically adds the conference to the main landing page of sysartifacts.

2. Add a conference specific site

Copy the `.md` from one of the existing conferences (e.g. `osdi.md`) in the root
folder to your conference name (e.g. `atc.md`). This will lead to creating
`atc.html` when rendered.

Adopt this page to your conference name by changing the title and the code
snippet which creates the list of AE years. (e.g. change `OSDI` to `ATC`)

3. Create a link in the top menu to the conference specific site

The top menu is defined in `_data/navigation.yml` under the variable main.
Simply add your conference name in alphabetical order to the main menu and set
the location to the previously created conference specific site (here
`atc.html`).
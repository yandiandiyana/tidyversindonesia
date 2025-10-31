# tidyversindonesia

## A Learning Bridge to the Tidyverse for Indonesia

`tidyversindonesia` helps Indonesian learners explore data science concepts through familiar language.  
It provides Tidyverse functions with Indonesian-language names, serving as an educational bridge to the original Tidyverse ecosystem.

The package follows the Tidyverse data-science workflow — *import*, *tidy*, *transform*, *visualize*, *model*, and *communicate* — making it easier for beginners to learn step by step before transitioning to standard Tidyverse syntax.

---

## Key Features

- Functions with names translated into Bahasa Indonesia.  
- Consistent with the Tidyverse philosophy and syntax.  
- Supports the full data science cycle: **import → tidy → transform → visualize → model → communicate**.  
- Designed for education, tutorials, and self-learning for Indonesian-speaking audiences.  

---

## Installation

You can install the development version of **tidyversindonesia** from GitHub using:

```r
# Install remotes package if not installed
install.packages("remotes")

# Install tidyversindonesia from GitHub
remotes::install_github("yandiandiyana/tidyversindonesia")
```

After installation, load the package:

```r
library(tidyversindonesia)
```

---

## Example

Here’s a simple example using `visualisasi_plot()`, `estetika()`, and `geometrik_titik()` — the Indonesian versions of `ggplot()`, `aes()`, and `geom_point()`:

```r
# Fungsi visualisasi versi Bahasa Indonesia
visualisasi_plot(penguins, estetika(x = bill_len, y = bocy_mass, color = species)) +
  geometrik_titik()
```

*(This example will create a scatter plot of penguin bill length vs. body mass.)*

---

## Learning Path

`tidyversindonesia` is designed to help learners master data science the Tidyverse way:

1. **Import** – read data from multiple sources  
2. **Tidy** – clean and reshape data for analysis  
3. **Transform** – derive new variables and summaries  
4. **Visualize** – create meaningful plots with `ggplot2`  
5. **Model** – explore statistical and predictive models  
6. **Communicate** – share insights through reports and visualizations

Once familiar with these workflows, learners can easily transition to the standard Tidyverse functions.

---

## Contributing

Contributions are welcome!  
If you’d like to add new Indonesian function names, fix bugs, or improve documentation:

1. Fork this repository  
2. Create a new branch (`git checkout -b feature-name`)  
3. Commit your changes (`git commit -m "Add new feature"`)  
4. Push to the branch (`git push origin feature-name`)  
5. Open a pull request  

For major changes, please open an issue first to discuss what you’d like to change.

---

## License

This package is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.

---

## Author

**Yandi Andiyana**  
Email: yandi.andiyana@gmail.com  
GitHub: [yandiandiyana](https://github.com/yandiandiyana)

---

## Acknowledgements

Inspired by the [Tidyverse](https://www.tidyverse.org/) project and its philosophy of making data science accessible, consistent, and elegant.

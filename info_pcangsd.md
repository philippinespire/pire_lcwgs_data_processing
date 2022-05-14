# PCAngsd Background Information

---

##  How To Access on `wahab.hpc.odu.edu`

```bash
enable_lmod
module load container_env ngsTools
# show help
crun pcangsd -h
# show version
crun pcangsd --version 
```

---

## Sources of Info on PCAngsd

* [GitHub Repo](https://github.com/Rosemeis/pcangsd)
* [PCAngsd Online Documentation](http://popgen.dk/software/index.php/PCAngsd)
  * Old version, no in use anymore 
* [PCAngsd Tutorial](http://www.popgen.dk/software/index.php/PCAngsdTutorial)
  * For the old version of PCAngsd, but still works ok
  * any pcangsd option that is a word need two dash 
* [PCAngsdv2 Online Documentation](http://www.popgen.dk/software/index.php/PCAngsdv2)
  * This is the version in the ngstools container on `wahab.hpc.odu.edu`  
* [PCAngsd Publication](https://academic.oup.com/genetics/article/210/2/719/5931101?login=true)
* [Publication on MAP test used by PCAngsd to Select Number of Eigenvalues](https://www.nature.com/articles/hdy201126)
* [Publication on Applying PCA to SNP Data to Detect Population Structure](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.0020190)

---

## How Does PCAngsd Work

In a nutshell, PCAngsd does the following:
* Generate a covariance matrix of pairwise similarities between individuals based on the genetic data (genotype probs)
* Uses the [MAP Test](https://www.nature.com/articles/hdy201126) to identify the appropriate number of principle components (eigenvalues) used to generate the covariance matrix of pairwise similarities among individuals
* 

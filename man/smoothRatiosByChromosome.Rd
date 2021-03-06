% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smoothRatiosByChromosome.R
\name{smoothRatiosByChromosome}
\alias{smoothRatiosByChromosome}
\title{backgound correction and smooth by chromosome}
\usage{
smoothRatiosByChromosome(se, chr = paste0("chr", c(seq_len(21), "X", "Y")),
  ratioAssay = "ratio", backgroundCorrectionAssay = "bcRatio",
  smoothedRatioAssay = "smoothedRatio", zscoreAssay = "zscore",
  backgroundPercentage = 0.25, chrom.level.background = TRUE, ...)
}
\arguments{
\item{se}{An object of 
\link[SummarizedExperiment]{RangedSummarizedExperiment} 
with scores. Output of \link{log2se}}

\item{chr}{A character vector, used to filter out seqnames. It should be the
chromosome names to be kept.}

\item{ratioAssay}{The name of assay in se, which store the values 
to be smoothed.}

\item{backgroundCorrectionAssay, smoothedRatioAssay, zscoreAssay}{character(1).
Assays names for background corrected ratios, smoothed ratios and 
z-scores based on background corrected ratios.}

\item{backgroundPercentage}{numeric(1). Percentage of values for background, 
see \link{zscoreOverBck}. How many percent lower values will be treated as
background, default lower 25 percent.
chrom.level.background TRUE or FALSE, default to TRUE, use chromosome-level background
to calculate z-score}

\item{...}{Parameters could be passed to \link{butterFilter}.}
}
\value{
A \link[S4Vectors]{SimpleList} of 
\link[SummarizedExperiment]{RangedSummarizedExperiment}
with smoothed ratios.
}
\description{
Split the ratios by chromosome and do background correction and smooth.
}
\examples{

data(single.count)
se <- single.count
dat <- log2se(se, nucleosomeCols="nucleosome.bam", genomeCols="genome.bam", 
transformation="log2Ratio")
dat1 <- smoothRatiosByChromosome(dat, N=100)
dat2 <- smoothRatiosByChromosome(dat, N=100, chrom.level.background = FALSE)

}
\author{
Jianhong Ou and Julie Zhu
}

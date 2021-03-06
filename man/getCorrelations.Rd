% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCorrelations.R
\name{getCorrelations}
\alias{getCorrelations}
\title{get correlations for replicates}
\usage{
getCorrelations(se, chr = paste0("chr", seq_len(21)), ratioAssay = "ratio",
  window = 10000, cutoff = 1, method = c("spearman", "pearson",
  "kendall"), ...)
}
\arguments{
\item{se}{A \link[SummarizedExperiment]{RangedSummarizedExperiment} object.
The output of \link{log2se}.}

\item{chr}{A vector of character. Filter for seqnames. It should be the
chromosome names to be kept.}

\item{ratioAssay}{character(1). 
Column name of ratio for correlation calculation.}

\item{window}{numeric(1) or integer(1). 
The window size for summary of the ratios.}

\item{cutoff}{numeric(1). All the coverages lower than cutoff value 
in a given window will be filtered out.}

\item{method}{A character string indicating which correlation coefficient
is to be computed. See \link[stats]{cor}.}

\item{...}{Parameters not used.}
}
\value{
A list of matrixes of correlation and coefficient.
}
\description{
Get the correlations of replicates by the coverage of peaks.
             The signals will be filter by the background cutoff value and
             the correlations will be calculated.
}
\examples{
data(triplicates.counts)
se <- triplicates.counts
gps <- c("26", "28", "29")
se <- log2se(se, 
             nucleosomeCols = paste0("N", gps, ".bam"),
             genomeCols = paste0("G", gps, ".bam"))
getCorrelations(se, chr="chr18")

}

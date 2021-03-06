% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_pointinterval.R
\name{geom_pointinterval}
\alias{geom_pointinterval}
\title{Point + multiple uncertainty interval plots (ggplot geom)}
\usage{
geom_pointinterval(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  side = "both",
  orientation = NA,
  show_slab = FALSE,
  show.legend = c(size = FALSE)
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}} or
\code{\link[ggplot2:aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{The position adjustment to use for overlapping points on this layer. Setting this equal to
\code{"dodge"} can be useful if you have overlapping intervals.}

\item{...}{
  Arguments passed on to \code{\link[=geom_slabinterval]{geom_slabinterval}}
  \describe{
    \item{\code{scale}}{What proportion of the region allocated to this geom to use to draw the slab. If \code{scale = 1},
slabs that use the maximum range will just touch each other. Default is \code{0.9} to leave some space.}
    \item{\code{justification}}{Justification of the interval relative to the slab, where \code{0} indicates bottom/left
justification and \code{1} indicates top/right justification (depending on \code{orientation}). If \code{justification}
is \code{NULL} (the default), then it is set automatically based on the value of \code{side}: when \code{side} is
\code{"top"}/\code{"right"} \code{justification} is set to \code{0}, when \code{side} is \code{"bottom"}/\code{"left"}
\code{justification} is set to \code{1}, and when \code{side} is \code{"both"} \code{justification} is set to
\code{0.5}.}
    \item{\code{normalize}}{How to normalize heights of functions input to the \code{thickness} aesthetic. If \code{"all"}
(the default), normalize so that the maximum height across all data is \code{1}; if \code{"panels"}, normalize within
panels so that the maximum height in each panel is \code{1}; if \code{"xy"}, normalize within
the x/y axis opposite the \code{orientation} of this geom so that the maximum height at each value of the
opposite axis is \code{1}; if \code{"groups"}, normalize within values of the opposite axis and within
groups so that the maximum height in each group is \code{1}; if \code{"none"}, values are taken as is with no
normalization (this should probably only be used with functions whose values are in [0,1], such as CDFs).}
    \item{\code{interval_size_domain}}{The minimum and maximum of the values of the size aesthetic that will be translated into actual
sizes for intervals drawn according to \code{interval_size_range} (see the documentation for that argument.)}
    \item{\code{interval_size_range}}{(Deprecated). This geom scales the raw size aesthetic values when drawing interval and point sizes, as
they tend to be too thick when using the default settings of \code{\link[=scale_size_continuous]{scale_size_continuous()}}, which give sizes
with a range of \code{c(1, 6)}. The \code{interval_size_domain} value indicates the input domain of raw size values
(typically this should be equal to the value of the \code{range} argument of the \code{\link[=scale_size_continuous]{scale_size_continuous()}}
function), and \code{interval_size_range} indicates the desired output range of the size values (the min and max of
the actual sizes used to draw intervals). Most of the time it is not recommended to change the value of this argument,
as it may result in strange scaling of legends; this argument is a holdover from earlier versions
that did not have size aesthetics targeting the point and interval separately. If you want to adjust the
size of the interval or points separately, you can instead use the \code{interval_size} or \code{point_size}
aesthetics; see \link{scales}.}
    \item{\code{fatten_point}}{A multiplicative factor used to adjust the size of the point relative to the size of the
thickest interval line. If you wish to specify point sizes directly, you can also use the \code{point_size}
aesthetic and \code{\link[=scale_point_size_continuous]{scale_point_size_continuous()}} or \code{\link[=scale_point_size_discrete]{scale_point_size_discrete()}}; sizes
specified with that aesthetic will not be adjusted using \code{fatten_point}.}
    \item{\code{show_point}}{Should the point portion of the geom be drawn? Default \code{TRUE}.}
    \item{\code{show_interval}}{Should the interval portion of the geom be drawn? Default \code{TRUE}.}
    \item{\code{na.rm}}{If \code{FALSE}, the default, missing values are removed with a warning. If \code{TRUE}, missing
values are silently removed.}
    \item{\code{inherit.aes}}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}
  }}

\item{side}{Which side to draw the slab on. \code{"topright"}, \code{"top"}, and \code{"right"} are synonyms
which cause the slab to be drawn on the top or the right depending on if \code{orientation} is \code{"horizontal"}
or \code{"vertical"}. \code{"bottomleft"}, \code{"bottom"}, and \code{"left"} are synonyms which cause the slab
to be drawn on the bottom or the left depending on if \code{orientation} is \code{"horizontal"} or
\code{"vertical"}. \code{"topleft"} causes the slab to be drawn on the top or the left, and \code{"bottomright"}
causes the slab to be drawn on the bottom or the right. \code{"both"} draws the slab mirrored on both
sides (as in a violin plot).}

\item{orientation}{Whether this geom is drawn horizontally (\code{"horizontal"}) or
vertically (\code{"vertical"}). The default, \code{NA}, automatically detects the orientation based on how the
aesthetics are assigned, and should generally do an okay job at this. When horizontal (resp. vertical),
the geom uses the \code{y} (resp. \code{x}) aesthetic to identify different groups, then for each group uses
the \code{x} (resp. \code{y}) aesthetic and the \code{thickness} aesthetic to draw a function as an slab, and draws
points and intervals horizontally (resp. vertically) using the \code{xmin}, \code{x}, and \code{xmax} (resp.
\code{ymin}, \code{y}, and \code{ymax}) aesthetics. For compatibility with the base
ggplot naming scheme for \code{orientation}, \code{"x"} can be used as an alias for \code{"vertical"} and \code{"y"} as an alias for
\code{"horizontal"} (tidybayes had an \code{orientation} parameter before ggplot did, and I think the tidybayes naming
scheme is more intuitive: \code{"x"} and \code{"y"} are not orientations and their mapping to orientations is, in my
opinion, backwards; but the base ggplot naming scheme is allowed for compatibility).}

\item{show_slab}{Should the slab portion of the geom be drawn? Default \code{TRUE}.}

\item{show.legend}{Should this layer be included in the legends? Default is \code{c(size = FALSE)}, unlike most geoms,
to match its common use cases. \code{FALSE} hides all legends, \code{TRUE} shows all legends, and \code{NA} shows only
those that are mapped (the default for most geoms).}
}
\value{
A \link[ggplot2:ggplot2-ggproto]{ggplot2::Geom} representing a point+multiple uncertainty interval geometry which can
be added to a \code{\link[=ggplot]{ggplot()}} object.
}
\description{
Combined point + multiple interval geoms with default aesthetics
designed for use with output from \code{\link[=point_interval]{point_interval()}}.
Wrapper around \code{\link[=geom_slabinterval]{geom_slabinterval()}}.
}
\details{
These geoms are wrappers around \code{\link[=geom_slabinterval]{geom_slabinterval()}} with defaults designed to produce
points+interval plots. These geoms set some default aesthetics equal
to the \code{.lower}, \code{.upper}, and \code{.width} columns generated by the \code{point_interval} family
of functions, making them often more convenient than vanilla \code{\link[=geom_pointrange]{geom_pointrange()}} when used with
functions like \code{\link[=median_qi]{median_qi()}}, \code{\link[=mean_qi]{mean_qi()}}, \code{\link[=mode_hdi]{mode_hdi()}}, etc.

Specifically, \code{geom_pointinterval} acts as if its default aesthetics are
\code{aes(size = -.width)}.
}
\section{Aesthetics}{

These geoms support the following aesthetics:
\itemize{
\item \code{x}
\item \code{y}
\item \code{datatype}
\item \code{alpha}
\item \code{colour}
\item \code{linetype}
\item \code{fill}
\item \code{shape}
\item \code{stroke}
\item \code{point_colour}
\item \code{point_fill}
\item \code{point_alpha}
\item \code{point_size}
\item \code{size}
\item \code{interval_colour}
\item \code{interval_alpha}
\item \code{interval_size}
\item \code{interval_linetype}
\item \code{slab_size}
\item \code{slab_colour}
\item \code{slab_fill}
\item \code{slab_alpha}
\item \code{slab_linetype}
\item \code{ymin}
\item \code{ymax}
\item \code{xmin}
\item \code{xmax}
\item \code{width}
\item \code{height}
\item \code{thickness}
\item \code{group}
}
See examples of some of these aesthetics in action in \code{vignette("slabinterval")}.
Learn more about the sub-geom aesthetics (like \code{interval_color}) in the \link[ggdist]{scales} documentation.
Learn more about basic ggplot aesthetics in \code{vignette("ggplot2-specs")}.
}

\examples{

library(dplyr)
library(ggplot2)

data(RankCorr_u_tau, package = "ggdist")

# orientation is detected automatically based on
# use of xmin/xmax or ymin/ymax

RankCorr_u_tau \%>\%
  group_by(i) \%>\%
  median_qi(.width = c(.8, .95)) \%>\%
  ggplot(aes(y = i, x = u_tau, xmin = .lower, xmax = .upper)) +
  geom_pointinterval()

RankCorr_u_tau \%>\%
  group_by(i) \%>\%
  median_qi(.width = c(.8, .95)) \%>\%
  ggplot(aes(x = i, y = u_tau, ymin = .lower, ymax = .upper)) +
  geom_pointinterval()

}
\seealso{
See \code{\link[=geom_slabinterval]{geom_slabinterval()}} for the geom that these geoms wrap. All parameters of that geom are
available to these geoms.

See \code{\link[=stat_pointinterval]{stat_pointinterval()}} for the stat version, intended
for use on samples from a distribution.
See \code{\link[=geom_interval]{geom_interval()}} for a similar stat intended for intervals without
point summaries.
See \code{\link[=stat_sample_slabinterval]{stat_sample_slabinterval()}} for a variety of other
stats that combine intervals with densities and CDFs.
See \code{\link[=geom_slabinterval]{geom_slabinterval()}} for the geom that these geoms wrap. All parameters of that geom are
available to these geoms.
}
\author{
Matthew Kay
}

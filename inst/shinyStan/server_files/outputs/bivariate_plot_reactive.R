# This file is part of shinyStan
# Copyright (C) 2015 Jonah Sol Gabry & Stan Development Team
#
# shinyStan is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
# 
# shinyStan is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>.



# bivariate_plot
bivariate_plot <- reactive({
  
  validate(
    need(input$param, message = FALSE),
    need(input$bivariate_ellipse_lev, message = FALSE),
    need(input$bivariate_param_y, message = FALSE)
    )
  
  if (!is.null(input$bivariate_ellipse_lev)) {
    validate(
    need(is.numeric(input$bivariate_pt_size), message = "Point size must be numeric"),
    need(is.numeric(input$bivariate_pt_shape), message = "Point shape must be numeric")
    )
    
    if (input$bivariate_ellipse_lev != "None") {
      validate(
        need(input$param != input$bivariate_param_y, "For this option the x and y can't be the same parameter."),
        need(is.numeric(input$bivariate_ellipse_lwd), message = "Ellipse size must be numeric"),
        need(is.numeric(input$bivariate_ellipse_lty), message = "Ellipse shape must be numeric")
      )
    }
  }

  do.call(".bivariate_plot", args = list(
    samps       = samps_post_warmup,
    param       = input$param,
    param2      = input$bivariate_param_y,
    pt_alpha    = input$bivariate_pt_alpha,
    pt_size     = input$bivariate_pt_size,
    pt_shape    = input$bivariate_pt_shape,
    pt_color    = input$bivariate_pt_color,
    ellipse_lev      = input$bivariate_ellipse_lev,
    ellipse_color    = input$bivariate_ellipse_color,
    ellipse_lty      = input$bivariate_ellipse_lty,
    ellipse_lwd      = input$bivariate_ellipse_lwd,
    ellipse_alpha    = input$bivariate_ellipse_alpha,
    lines            = input$bivariate_lines,
    lines_color      = input$bivariate_lines_color,
    lines_alpha      = input$bivariate_lines_alpha,
    transform_x      = input$bivariate_transform_x,
    transform_y      = input$bivariate_transform_y
  ))
})

library(knitr)
knit_hooks$set(deco = function(before, options) {
  if (before) {
    label <- ifelse(is.null(options$deco$label), "",
                    paste0("<b>", options$deco$label, "</b>"))
    bc <- ifelse(is.null(options$deco$bc), "#636363", options$deco$bc)
    sz <- ifelse(is.null(options$deco$sz), "90%", options$deco$sz)
    tc <- ifelse(is.null(options$deco$bc), "#bdbdbd", options$deco$bc)
    icon <- ifelse(!is.null(options$deco$icon),
                   paste0("<i class=\"", options$deco$icon$style,
                          " fa-", options$deco$icon$name, "\"></i>  "), "")
    paste0("<div class=decocode>",
           "<div style=\"background-color:", bc, "\">",
           "<span style=\"font-size:", sz, ";color:", tc, "\">",
           icon, label, "</span>")
  } else {
    "</div></div>"
  }
})

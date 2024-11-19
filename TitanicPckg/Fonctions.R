devtools::create("TitanicPckg")
install.packages("roxygen2")
library(roxygen2)

#### TP Titanic packages

#' taux de survie en fonction du sex
#'
#' @param data TitanicSurvival 
#' @return A list
#' @examples
#' taux_survie_par_sexe(df)
#' @export

taux_survie_par_sexe <- function(data) {
  library(dplyr)
  return(data %>%
           group_by(sex) %>%
           summarize(TauxSurvie = sum(survived == "yes") / n()))
}




######################
######################

#' taux de survie en fonction de la classe
#' 
#' @param data TitanicSurvival 
#' @return A list
#' @examples
#' taux_de_survie_classe(df)
#' @export

taux_survie_par_classe <- function(data) {
  library(dplyr)
  return(data %>%
           group_by(passengerClass) %>%
           summarize(TauxSurvie = sum(survived == "yes") / n()))
}

devtools::document('TitanicPckg')
devtools::build('TitanicPckg')
devtools::install('TitanicPckg')


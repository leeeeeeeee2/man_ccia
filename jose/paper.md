---
title: "A narrative approach to building computational capacity for climate change impact assessment in professional master's students"
tags:
- Python
- climate change
- graduate
authors:
- name: Conor I. Anderson
  orcid: 0000-0003-2619-1207
  affiliation: 1
- name: Karen L. Smith
  orcid: 0000-0002-4652-6310
  affiliation: 1
affiliations:
- name: Department of Physical and Environmental Sciences, University of Toronto
  index: 1
date: 21 December 2021
bibliography: paper.bib
---

# Introduction

With the growing recognition of the cascading consequences of climate change, there is an increasing demand for graduate education in climate change impact assessment (CCIA). To facilitate improved transparency and technical skill-building in CCIA, we have developed a new series of step-by-step, coherently narrated, open-source Python labs aimed at building professional master's students' computational capacity and confidence, while providing foundational knowledge in CCIA and the opportunity to engage with state-of-the-art methods and data. The labs are presented in an open-source (CC-BY-SA 4.0) lab manual entitled _Climate Change Impact Assessment: A practical walk-through_, featuring accessibly annotated code that can be used both for independent study, or during interactive live-coding lab sessions.

# Statement of Need

The goal of a professional master's program is to help students rapidly transition from undergraduate learners to work-ready professionals. This presents a unique challenge for instructors to balance conceptual content with continually-evolving and often technical real-world application. The applied nature of such professional master's programs is often what attracts students to these programs, yet students sometimes struggle with the accelerated pace of technical skills development required in many of the courses. This is particularly true of the data-intensive discipline of CCIA. One approach that instructors have taken is to make use of new climate data platforms, aimed at non-technical end-users, which are now available online. Many of these platforms provide pre-processed data and off-the-shelf climate indices or variables, allowing students (and professionals) to conduct CCIA, but without first building sufficient understanding of how such data resources are generated. Although this approach allows for a focus on teaching the application of projected climate changes, it diverts attention from the scientific and technical aspects of CCIA leading to a lack of methodological transparency, and a reliance on external, sometimes proprietary, data platforms. Consequently, students are often left ill-equipped to independently acquire unprocessed global climate model (GCM) data, understand how to read that data into statistical analysis software, and to perform analysis of novel climate indices. We sought to address this gap in knowledge by creating a coherent narrative-driven set of Python-based lab exercises that lead students step-by-step through the CCIA process, with the goal of enabling students to acquire the foundational, technical skills of CCIA, as well as transferrable skills in Python programming and data analysis.


# Learning Objectives and Content

The lab book includes five scaffolded coding exercises, and narrative chapters that provide additional context and background knowledge for the exercises. Students following the manual learn how to programatically acquire observed historical Canadian climate data from Environment and Climate Change Canada [-@eccc2019], and perform basic analyses of meteorological variables and climate indices (Lab 1). In Lab 2 students learn how to acquire raw GCM data from the Coupled Model Intercomparison Project Phase 5 (CMIP5) via the Earth System Grid Federation. Lab 3 focuses on understanding how to navigate across these three-dimensional netCDF data sets, and extract relevant data points. In Lab 4, students use the data from Labs 1 and 2 to project changes to their assigned climate index through the year 2100. Lab 5 introduces statistically downscaled GCM data for Canada [@cannon2015bias], and students are asked to perform a comparative analysis between the raw and downscaled model data. Upon completion of the lab manual, students are able to perform a basic CCIA analysis from scratch; from the selection and definition of a climate index, to the projection of changes to that index by applying downscaled GCM data over the tridecades 2011--2040, 2041--2070, and 2071--2100.

Context chapters in the lab manual describe climate model complexity, the representative concentration pathways [the climate scenarios used for CMIP5; see @moss2010next], model selection strategies, and caveats to these strategies. In addition students learn transferrable concepts of data dimensionality, and programming in Python.

Note that although the lab book is self-contained, in practice the labs are combined with lectures that describe the details of the various downscaling methodologies and their applications and limitations, exploratory assignments and a capstone project.

# Teaching Experience

Three cohorts of students have used the lab manual to date. In the winter semester of 2019, we used start-of-term and end-of-term surveys to assess changes in CCIA-knowledge, knowledge of Python and related libraries, and student confidence in CCIA and coding. The surveys demonstrated that students improved their knowledge of both CCIA and the Python software. There were statistically significant improvements in answer accuracy for all questions, except for one, which students answered correctly nearly 100% of the time in both the pre- and post-term periods. Students also indicated a statistically significant increase in their confidence (on a scale from 1 to 5) in their abilities to perform technical tasks in CCIA. These initial results were presented in a poster at the Earth Educators' Rendezvous 2019, in Nashville, TN, in July 2019 [@smith2019narrative], and later, virtually, at the 2020 American Geophysical Union fall meeting [@anderson2020narrative].

# Story of the project

This project began as part of a redesign of a graduate course aimed at professional master's students, EES1117 "Climate Change Impact Assessment", at the University of Toronto Scarborough. EES1117 focuses on downscaling the impacts of the changing global climate to the regional scale and examining how these impacts affect various sectors. In past years, the curriculum for EES1117 was built around a closed, restricted-access platform providing pre-processed GCM data and change factors. While computationally efficient, much of the data analysis skill required to perform CCIA was obfuscated by the black-box nature of this platform. As a result, upon completing EES1117 as a student, Conor did not know where to obtain unprocessed GCM output, nor how to read or analyze the data. At the same time, he was committed to using only open data sources and software tools in his doctoral thesis. Conor replicated the key outputs of the closed platform with an open-source alternative, _Conjuntool_ [see @anderson2018conjuntool]. As the new instructor of EES1117, Karen saw value in this new tool and encouraged Conor to apply to the Department of Physical and Environmental Sciences' Teaching Fellowship Program to contribute to the course redesign. The lab book was developed as a result of Conor's successful application, and _Conjuntool_ is used in the exercises therein.

# References

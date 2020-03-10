author_reader_rr_1.fig: author_reader_rr.fig author_reader_rr.subfig
	$(COMMON_PREFIX)/usr/share/texmf/scripts/latex-make/figdepth.py             < $< > $@ 35 40

author_reader_rr_2.fig: author_reader_rr.fig author_reader_rr.subfig
	$(COMMON_PREFIX)/usr/share/texmf/scripts/latex-make/figdepth.py             < $< > $@ 35 40 45 50 60

author_reader_rr_3.fig: author_reader_rr.fig author_reader_rr.subfig
	$(COMMON_PREFIX)/usr/share/texmf/scripts/latex-make/figdepth.py             < $< > $@ 35 40 45 50 60 70 75 80

author_reader_rr_4.fig: author_reader_rr.fig author_reader_rr.subfig
	$(COMMON_PREFIX)/usr/share/texmf/scripts/latex-make/figdepth.py             < $< > $@ 35 40 45 50 60 70 75 76 80

author_reader_rr_5.fig: author_reader_rr.fig author_reader_rr.subfig
	$(COMMON_PREFIX)/usr/share/texmf/scripts/latex-make/figdepth.py             < $< > $@ 35 40 45 50 60 70 75 80 86 90

AUTHOR_READER_RR_FIGS := $(foreach n,  1  2  3  4  5  , author_reader_rr_$(n).fig)
FILES_TO_DISTCLEAN += $(AUTHOR_READER_RR_FIGS)
FIGS2CREATE_LIST += $(AUTHOR_READER_RR_FIGS)
$(TEMPORAIRE): $(AUTHOR_READER_RR_FIGS)
$(TEMPORAIRE): $(AUTHOR_READER_RR_FIGS)

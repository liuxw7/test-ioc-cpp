# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug)
  OBJDIR     = Debug/obj/Debug/dicpp
  TARGETDIR  = ../macosx/bin/Debug
  TARGET     = $(TARGETDIR)/libdicpp.a
  DEFINES   += -DDEBUG -D_DEBUG -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I.. -I../googlemock/fused-src -I../Hypodermic -I../sauce -I../wallaroo -I../PocoCapsule/include -I../picojson -I../dicpp/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -v  -fPIC -std=c++0x -stdlib=libc++ -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L..
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -lpthread -lc++
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = Release/obj/Release/dicpp
  TARGETDIR  = ../macosx/bin/Release
  TARGET     = $(TARGETDIR)/libdicpp.a
  DEFINES   += -DRELEASE -DGTEST_USE_OWN_TR1_TUPLE=1
  INCLUDES  += -I.. -I../googlemock/fused-src -I../Hypodermic -I../sauce -I../wallaroo -I../PocoCapsule/include -I../picojson -I../dicpp/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -v  -fPIC -std=c++0x -stdlib=libc++ -std=c++11
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -Wl,-x
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -lpthread -lc++
  LDDEPS    += 
  LINKCMD    = $(AR) -rcs $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/demangle.o \
	$(OBJDIR)/empty.o \
	$(OBJDIR)/injected_member.o \
	$(OBJDIR)/injector.o \
	$(OBJDIR)/registry.o \
	$(OBJDIR)/scope.o \
	$(OBJDIR)/type_info.o \
	$(OBJDIR)/type_provider.o \
	$(OBJDIR)/no_scope.o \
	$(OBJDIR)/singleton.o \
	$(OBJDIR)/thread_local_singleton.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking dicpp
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning dicpp
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	-$(SILENT) cp $< $(OBJDIR)
else
	$(SILENT) xcopy /D /Y /Q "$(subst /,\,$<)" "$(subst /,\,$(OBJDIR))" 1>nul
endif
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
endif

$(OBJDIR)/demangle.o: ../dicpp/lib/src/demangle.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/empty.o: ../dicpp/lib/src/empty.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/injected_member.o: ../dicpp/lib/src/injected_member.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/injector.o: ../dicpp/lib/src/injector.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/registry.o: ../dicpp/lib/src/registry.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/scope.o: ../dicpp/lib/src/scope.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/type_info.o: ../dicpp/lib/src/type_info.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/type_provider.o: ../dicpp/lib/src/type_provider.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/no_scope.o: ../dicpp/lib/src/scopes/no_scope.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/singleton.o: ../dicpp/lib/src/scopes/singleton.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/thread_local_singleton.o: ../dicpp/lib/src/scopes/thread_local_singleton.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)

#ifndef TRANSFORMATION_H
#define TRANSFORMATION_H

#include <stdbool.h>

#include "str_builder.h"

typedef struct Trafo Trafo;

Trafo *trafo_create(const char *formats, char *err, int err_len);
void trafo_destroy(Trafo *trafo);
void trafo_apply(Trafo *trafo, str_builder_t *sb, char **captures, int capture_count);
bool trafo_has_else(struct Trafo *trafo);

#endif

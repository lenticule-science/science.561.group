---
author: Jared Lumpe
title: ox-json documentation
description: ~ox-json-export-to-file~ ~ox-json-export-to-buffer~
aliases:
  - ox-json documentation
---

# <span class="todo TODO">TODO</span> Installation {#installation}

# <span class="todo TODO">TODO</span> Usage {#usage}

`ox-json-export-to-file` `ox-json-export-to-buffer`

# Output format

## Data types

Exported JSON objects which contain structured data have a special "data type" property which indicates the type of data they represent. This is meant to make it easier for external tools to interpret. Objects lacking this property represent simple key-value mappings with no additional implied structure.

By default this property is named `"$$data_type"` but its value can be customized with the `:json-data-type-property`{.verbatim} option (see the <span class="spurious-link" target="*Options">*options*</span> section).

### org-document

This is the top-level object generated when the entire file is exported.

1.  Properties

    `"properties"` (object)  
    File-level properties

    `"title"` (array)  
    Document title (secondary string)

    `"filetags"` (array of strings)  

    `"author"` (string)  

    `"creator"` (string)  

    `"date"` (array)  
    (secondary string)

    `"description"` (array)  
    (secondary string)

    `"email"` (string)  

    `"language"` (string)  

    `"contents"` (array)  
    The top-level elements in the document. This should consist of an optional `section`{.verbatim} node followed by any number of `header`{.verbatim} nodes.

### org-node

A node (element or object) in the document's parse tree.

See the [Org element API documentation](https://orgmode.org/worg/dev/org-element-api.html) for the list of node types and their properties.

1.  Properties

    `"type"` (string)  
    Type of node, given by `org-element-type`.

    `"ref"` (string)  
    A unique string assigned to all nodes during the export process, from `org-export-get-reference`.

    `"contents"` (array)  
    Contents of the node. Array of node objects or strings.

    `"properties"` (object)  
    Object/element properties from org element API.

    `"drawer"` (object)  
    (headline nodes only) Properties defined in `:PROPERTIES:` drawer.

### error

This object appears in place of other values (typically within an `org-node`{.verbatim}'s properties) when there was an error exporting that value.

`"message"` (string)  
A message describing why the error occurred.

## Node types with specific handling

Some node types are exported with additional data:

### headline

### link

1.  Additional properties

    `is-inline-image`{.verbatim} (bool)  
    Whether org mode think this link should be rendered as an inline image.

    `is-internal`{.verbatim} (bool)  
    Whether this link points to a location in the same document. True for the `id`{.verbatim}, `fuzzy`{.verbatim}, and `radio`{.verbatim} link types.

    `target-ref`{.verbatim} (string)  
    The `ref`{.verbatim} property of the headline or other node this link resolves to. Only exists for internal links.

### timestamp

1.  Additional properties

    `"start"`, `"end"` (string)  
    Year/month/day/hour/minute from the `start-*`{.verbatim} and `end-*`{.verbatim} sets of properties combined together and encoded as a single string in [ISO 8601](https://www.w3.org/TR/NOTE-datetime) format.

# <span class="todo TODO">TODO</span> Agenda {#agenda}

# Customization

## Options

| Property                                    | Data type | Default                                       |
|---------------------------------------------|-----------|-----------------------------------------------|
| `:json-data-type-property`{.verbatim}       | string    | `"$$data_type"`                               |
| `:json-exporters`{.verbatim}                | plist     | See variable `ox-json-default-type-exporters` |
| `:json-property-types`{.verbatim}           | plist     | See variable `ox-json-default-property-types` |
| `:json-strict`{.verbatim}                   | bool      | `nil`                                         |
| `:json-include-extra-properties`{.verbatim} | bool      | `t`                                           |

### Details

`:json-data-type-property`{.verbatim}  
Name of the property added to JSON objects which indicates the type of data they represent. Set to `nil` to disable.

`:json-exporters`{.verbatim}  

`:json-property-types`{.verbatim}  

`:json-strict`{.verbatim}  

`:json-include-extra-properties`{.verbatim}  

# Changelog

## 0.3.0 {#section}

### Backwards-incompatible changes

- All of the top-level document attributes (`author`{.verbatim}, `date`{.verbatim}, etc.) are now grouped under the `"properties"` key of the `org-document`{.verbatim} object.
- Export `start`{.verbatim} property of `timestamp`{.verbatim} nodes with the correct name. Was being exported with the name `begin`{.verbatim}.
- JSON objects representing generic key/value mappings no longer have the `"$$data_type"` property.

### Features

- Data in property drawers is now exported with headlines in the `"drawer"` property.

### Other

- Now requires Emacs 26.1.
- Reorganized/cleaned up much of the internals.

## 0.2.0 {#section-1}

## 0.1 {#section-2}

Initial version.

# Internals

## <span class="todo TODO">TODO</span> API {#api}

### Basic JSON encoding functions

### Advanced JSON encoding

### Exporting org nodes and properties

\## Earlier material

By default this property is named \`"$$data_type"` but its value can be customized with the `:json-data-type-property`{.verbatim} option (see the <span class="spurious-link" target="*Options">*options*</span> section).

1.  Properties

`"filetags"` (array of strings)

`"author"` (string)

`"creator"` (string)

`"date"` (array)  
    (secondary string)

`"description"` (array)  
    (secondary string)

`"email"` (string)

`"language"` (string)

`"contents"` (array)  
    The top-level elements in the document. This should consist of an optional `section`{.verbatim} node followed by any number of `header`{.verbatim} nodes.

See the [Org element API documentation](https://orgmode.org/worg/dev/org-element-api.html) for the list of node types and their properties.

This object appears in place of other values (typically within an `org-node`{.verbatim}'s properties) when there was an error exporting that value.

1.  Additional properties

`is-inline-image`{.verbatim} (bool)  
    Whether org mode think this link should be rendered as an inline image.

`is-internal`{.verbatim} (bool)  
    Whether this link points to a location in the same document. True for the `id`{.verbatim}, `fuzzy`{.verbatim}, and `radio`{.verbatim} link types.

`target-ref`{.verbatim} (string)  
    The `ref`{.verbatim} property of the headline or other node this link resolves to. Only exists for internal links.

`"start"`, `"end"` (string)  
    Year/month/day/hour/minute from the `start-*`{.verbatim} and `end-*`{.verbatim} sets of properties combined together and encoded as a single string in [ISO 8601](https://www.w3.org/TR/NOTE-datetime) format.

| Property                                    | Data type | Default                                       |
|---------------------------------------------|-----------|-----------------------------------------------|
| `:json-data-type-property`{.verbatim}       | string    | `"$$data<sub>type</sub>"\` \|

|                                               |       |                                                 |
|-----------------------------------------------|-------|-------------------------------------------------|
| \`:json-exporters\`{.verbatim}                | plist | See variable \`ox-json-default-type-exporters\` |
| \`:json-property-types\`{.verbatim}           | plist | See variable \`ox-json-default-property-types\` |
| \`:json-strict\`{.verbatim}                   | bool  | \`nil\`                                         |
| \`:json-include-extra-properties\`{.verbatim} | bool  | \`t\`                                           |

\`:json-data-type-property\`{.verbatim} Name of the property added to JSON objects which indicates the type of data they represent. Set to \`nil\` to disable.

\`:json-exporters\`{.verbatim}

\`:json-property-types\`{.verbatim}

\`:json-strict\`{.verbatim}

\`:json-include-extra-properties\`{.verbatim}

- All of the top-level document attributes (\`author\`{.verbatim}, \`date\`{.verbatim}, etc.) are now grouped under the \`"properties"\` key of the \`org-document\`{.verbatim} object.
- Export \`start\`{.verbatim} property of \`timestamp\`{.verbatim} nodes with the correct name. Was being exported with the name \`begin\`{.verbatim}.
- JSON objects representing generic key/value mappings no longer have the \`"\$\$data<sub>type</sub>"\` property.

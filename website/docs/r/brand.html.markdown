---
layout: 'okta'
page_title: 'Okta: okta_brand'
sidebar_current: 'docs-okta-resource-brand'
description: |-
  Gets, updates, an Okta Brand.
---

# okta_brand

This resource allows you to get and update an Okta
[Brand](https://developer.okta.com/docs/reference/api/brands/#brand-object).
The Okta Management API does not have a true Create or Delete for a brand.
Therefore, import the brand resource by its ID into the terraform state before
applying updates. Alternatively, the default brand can be retrieved by setting
`brand_id` to `default` which is a fake create to shortcut having to do an
import.

## Example Usage

```hcl
# resource has been imported into current state
# $ terraform import okta_brand.example <brand id>
resource "okta_brand" "example" {
  agree_to_custom_privacy_policy = true
  custom_privacy_policy_url      = "https://example.com/privacy-policy"
  remove_powered_by_okta         = true
}

# setting brand_id to default is equivalent to importing the default brand by its ID
resource "okta_brand" "default" {
  brand_id = "default"
  agree_to_custom_privacy_policy = true
  custom_privacy_policy_url      = "https://example.com/privacy-policy"
  remove_powered_by_okta         = true
}
```

## Argument Reference

- `brand_id` - (Optional) Brand ID, used for read (faux-create). Setting `brand_id` to `default` is equivalent to importing the default brand by its ID.

## Attributes Reference

- `id` - (Read-only) Brand ID

- `agree_to_custom_privacy_policy` - Is a required input flag with when changing custom_privacy_url, shouldn't be considered as a readable property

- `custom_privacy_policy_url` - (Optional) Custom privacy policy URL

- `links` - (Read-only) Link relations for this object - JSON HAL - Discoverable resources related to the brand

- `remove_powered_by_okta` - (Optional) Removes "Powered by Okta" from the Okta-hosted sign-in page, and "© 2021 Okta, Inc." from the Okta End-User Dashboard

## Import

An Okta Brand can be imported via the ID.

```
$ terraform import okta_brand.example &#60;brand id&#62;
```

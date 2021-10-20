/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {  
    iam_additive_list = flatten([
        for role, members in var.iam_additives:
        [for member in members: {role: role, member: member}]
    ])

    iam_additive_map = {
        for v in local.iam_additive_obj: "${v.role}/${v.member}" => v
    }

}

resource "google_artifact_registry_repository" "registry" {
  provider      = google-beta
  project       = var.project_id
  location      = var.location
  description   = var.description
  format        = var.format
  labels        = var.labels
  repository_id = var.id
}

resource "google_artifact_registry_repository_iam_binding" "bindings" {
  provider   = google-beta
  for_each   = var.iam
  project    = var.project_id
  location   = google_artifact_registry_repository.registry.location
  repository = google_artifact_registry_repository.registry.name
  role       = each.key
  members    = each.value
}

resource "google_artifact_registry_repository_iam_binding" "bindings_member" {
  provider   = google-beta
  for_each   = var.iam_additive_map
  project    = var.project_id
  location   = google_artifact_registry_repository.registry.location
  repository = google_artifact_registry_repository.registry.name
  role       = each.value.role
  member     = each.value.member
}

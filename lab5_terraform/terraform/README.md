**ReadMe.md**

# infrastructures

# Before start

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```
# Default variables

```
image_id = ubuntu-2204-lts
zone = ru-central1-a
subnet_id = determined automatically from the zone ("default-ru-central1-a", "default-ru-central1-b", "default-ru-central1-d")
```
<template>
  <div>
      <h1>List of Landmarks in Rome</h1>
      <landmark-list></landmark-list>
  </div>
</template>

<script>
import LandmarkList from "@/components/LandmarkList.vue";
export default {
    name: "the-landmarks",
    components: {
        LandmarkList
    }
}
</script>

<style>
body {
  background-image: url("~@/assets/backpack-image.jpg");
  background-position: top;
  background-size: 60rem 60rem;
  background-repeat: no-repeat;
  object-fit: cover;
}
</style>
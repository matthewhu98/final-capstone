<template>
  <div>
   <landmark-details v-for="location in locationList"
   v-bind:key="location.name"
   v-bind:location="location">

   </landmark-details>
  </div>
</template>

<script>
import LandmarkDetails from "@/components/LandmarkDetails.vue";
export default {
  name: "landmark-list",
  components: {
      LandmarkDetails
  },
  computed: {
      locationList(){
          const locationArray = this.$store.state.locations;
          return locationArray;
      }
  }
};
</script>

<style>
</style>
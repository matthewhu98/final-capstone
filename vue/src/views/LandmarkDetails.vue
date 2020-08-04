<template>
  <div>
      <landmark-details v-bind:landmark-id="parseInt($route.params.id)"/>
  </div>
</template>

<script>
import LandmarkDetails from "@/components/LandmarkDetails.vue";
export default {
    name: "LandmarkDetails",
    components:{
        LandmarkDetails
    }
}
</script>

<style>

</style>
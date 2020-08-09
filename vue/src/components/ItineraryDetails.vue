<template>
  <div>
    <div
      v-for="landmark in this.$store.state.landmarksInItinerary"
      v-bind:key="landmark.landmarkID"
    >
    
      <h1>{{landmark.name}}</h1>
      <div>
        <img class="single-image" v-bind:src="getImageUrl(landmark.img)" />
      </div>
    </div>
    <div>Itinerary Details</div>
    <div>{{this.$store.state.itineraries.name}}</div>
  </div>
</template>

<script>
import LandmarkService from "@/services/LandmarkService";
export default {
  name: "itinerary-details",
  image: "getImageUrl(landmark.img)",
  props: {
    itineraryID: Number,
    
  },
  methods: {
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
  },
  created() {
    LandmarkService.getItineraryDetails(this.itineraryID).then((response) => {
      this.$store.commit("SET_LANDMARKS_IN_ITINERARY", response.data);
    });
  },
};
</script>

<style>
</style>
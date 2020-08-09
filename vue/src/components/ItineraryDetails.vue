<template>
  <div>
   <h3 v-bind:value="getItineraryName(this.itineraryID)"> {{this.name}} </h3>

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
  data() {
    return {
     name: ''
    };
  },
  
  methods: {
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    },
    getItineraryName(id){
      this.$store.state.itineraries.map(single =>{
        if(single.itineraryID === id){
          this.name = single.name;
        }
      });
    }
  },
  created() {
    LandmarkService.getItineraryDetails(this.itineraryID).then((response) => {
      this.$store.commit("SET_LANDMARKS_IN_ITINERARY", response.data);
    });
    this.getItinerary(this.$store.state.user.id);
  },

  // computed: {
  //   activeItinerary(){
  //     this.$store.state.itineraries.map(single =>{
  //       if(single.itineraryID === this.itineraryID){
  //         this.name = single.name;
  //         return thname;
  //       }
        
  //     })
  //     return this.name;
      
  //   }
  // }
};
</script>

<style>
</style>
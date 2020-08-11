<template>
  <div>
   <h3 v-bind:value="getItineraryName(this.itineraryID)"> {{this.name}} </h3>
     <div class="IT-Container">
       <div 
         v-for="landmark in this.$store.state.landmarksInItinerary"
         v-bind:key="landmark.landmarkID">
    
       <!-- <h1>{{landmark.name}}</h1> -->
       <div class="img-container">
            <img class="single-image-IT" v-bind:src="getImageUrl(landmark.img)" />
       </div>
       <h1>{{landmark.name}}</h1>
    </div>
   </div>
    <!-- <div>Itinerary Details</div> -->
    <!-- <div>{{this.$store.state.itineraries.name}}</div> -->
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
  }
};
</script>

<style>

.It-container{
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 1rem;
  max-width: 80rem;
  margin: 5rem auto;
  padding: 10 5rem;
  filter: grayscale(50%);
}
.single-image-IT{
  --size: 250px;
  height: calc(var(--size) * 1.3);
  width: var(--size);
  /* border-radius: calc(var(--size) * 0.15); */
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
}
.img-container{
  grid-gap: 10px;
  color: white;
  filter: grayscale(25%);
  font-family: "Open Sans", sans-serif;
}
.img-container:hover{
  text-decoration: underline;

  filter: contrast(140%) saturate(150%)
    drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.475));
}

</style>
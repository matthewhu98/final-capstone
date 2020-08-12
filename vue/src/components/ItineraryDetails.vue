<template>
  <div>
   <div class="itinerary-name itinerary-title-color"  v-bind:value="getItineraryName(this.itineraryID)"> {{this.name}} </div>
   <router-link class="add-more-lands" v-bind:to="{ name: 'the-landmarks'}">
        Add More Attractions
      </router-link>
     <div class="IT-Container">

       <!-- <router-link
              class="title-home-page button"
              v-bind:to="{ name: 'the-landmarks'}"
            >Landmarks</router-link> -->
      

       <div class="objects container-panel" 
         v-for="landmark in this.$store.state.landmarksInItinerary"
         v-bind:key="landmark.landmarkID">
    
       <!-- <h1>{{landmark.name}}</h1> -->
       <div class="object">
           <div class="img-container">
               <img class="single-image-IT" v-bind:src="getImageUrl(landmark.img)" />
           </div>
           <div class="land-title">{{landmark.name}}</div>

           <div>
             <button class="delete-land-button" v-bind:id="landmark.landmarkID" v-on:click="deleteLand(landmark.landmarkID)"><i class="fas fa-trash-alt fa-2x"></i></button>
           </div>
        </div>
      </div>
   </div>
    <div class="page-footer">

  </div>
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
     name: '',
     itineraryLandmark:{
       itineraryId: this.itineraryID,
       landmarkId: 0
       
     }
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
    },
    reloadPage() {
      window.location.reload();
    },

    deleteLand(lId){
      this.itineraryLandmark.landmarkId = lId;
      LandmarkService.deleteLandmarkInItinerary(this.itineraryID,this.itineraryLandmark).then(response =>{
        if (response.status === 200){
          this.reloadPage();
          
        }
      })
      .catch(error => {
        if (error.response.status === 404) {
          this.$router.push("/not-found");
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

.IT-Container{
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
.land-title{
  color:white;
  text-decoration: none;
  font-size: 15px;
  position: relative;
  bottom: 10px;
  z-index: 3;
  font-family: 'Rock Salt', cursive;
}
.itinerary-name{
  font-family: "Poiret One", cursive;
  
  font-size: 5vw;
}
.fa-trash-alt:hover {
  color: #5ba1b0;
}
.delete-land-button{
  border: none;
  background: none;
  color: white;
}


.add-more-lands{
  position: center;
  /* right: 40px;
  top: 120px; */
  text-decoration: none;
  font-size: 20px;
  color: white;
}
.page-footer{
  height: 50px;
}
.itinerary-title-color{
  color: white;
}

</style>
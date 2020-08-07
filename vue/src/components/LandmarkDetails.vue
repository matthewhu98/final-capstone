<template >
  <div class="landmark-explained">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    >
    <div>
      <button
        v-on:click="showListOfItineraries = !showListOfItineraries"
      >{{showListOfItineraries === true ? "Cancel": "Add to Itineraries"}}</button>
    </div>
    <div v-show="showListOfItineraries">
      <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID">
        <h1>{{itinerary.name}}</h1>
        <button type="button" @click="addLandmarkToItinerary(itinerary.itineraryID)">name</button>
      </div>
    </div>
<!-- v-if="showListOfItineraries === true" -->
    <div>
      <h1 class="title">{{this.$store.state.activeLandmark.name}}</h1>
      <p class="description">{{this.$store.state.activeLandmark.discription}}</p>
    </div>
    <div>
      <img class="single-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)">
    </div>
  </div>
</template>

<script>
import LandmarkService from "@/services/LandmarkService";
export default {
  name: "landmark-details",
  image: "getImageUrl(this.$store.state.activeLandmark.img)",
  props: {
    landmarkID: Number
  },
  data() {
    return {
      itineraryLandmark: {
        landmarkId: this.$store.state.activeLandmark.landmarkID,
        itineraryId: 0
      },
      showListOfItineraries: false
    };
  },
  methods: {
    getImageUrl(pic) {
      return require(`@/assets/${pic}`);
    },
    addLandmarkToItinerary(itineraryId) {
      this.itineraryLandmark.itineraryId = itineraryId;
      LandmarkService.addLandmarkToItinerary(
        this.landmarkID,
        this.itineraryLandmark
      ).then(response => {
        if (response.status === 201) {
          this.$router.push("/landmarks");
        }
      });    
    }
  },
  created() {
    LandmarkService.getLandmark(this.landmarkID).then(response => {
      this.$store.commit("SET_ACTIVE_LANDMARK", response.data);
    });
  }
};
</script>

<style>
/* body{
  background-image: image;
} */
.single-image {
  height: 40rem;
  margin: 2rem;
}

.title {
  font-family: "Nanum Pen Script", cursive;
  font-size: 70px;
}

.description {
  font-family: "Nanum Gothic", sans-serif;
  font-size: 45px;
  border: 1px solid saddlebrown;
  margin: 3rem;
  padding: 2rem;
}

.landmark-explained {
  color: black;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
</style>
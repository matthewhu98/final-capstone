<template class="everything">
  <div class="container">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />

    <div id="search">
      <label for="name">Where do you want to go?</label>
      <input type="text" v-model="this.filter.location"/>
    </div> 

    <router-link class="itinerary-route" v-bind:to="{name: 'itineraries' , params: {id: this.$store.state.user.id}}">
        <i class="fas fa-clipboard-list"></i>
      </router-link>
    <div class="card" v-for="landmark in this.$store.state.landmarks" v-bind:key="landmark.name">
      <div class="image-div">
        <router-link
          class="title"
          v-bind:to="{name: 'landmarkdetails' 
          , params: {id: landmark.landmarkID}}"
        >
          {{landmark.name}}
          <div class="circle">
            <img class="image" v-bind:src="getImageUrl(landmark.img)" />
          </div>
          <div>
            
          </div>
        </router-link>
        <!-- <button v-on:click.prevent="getItinerary(this.$store.state.user.user_id)"></button> -->
      </div>
    </div>
  </div>
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      filter: {
        location: ""
      }
    }
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then(response => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    }
  },
  computed: {
    filterLandmark() {
      let filteredLocation = this.$store.state.landmarks.name;
        if (this.filter.location != "") {
          filteredLocation = filteredLocation.filter(location => {
            location.name.toLowerCase().includes(this.filter.location.toLowerCase())
          });
        } 
        return filteredLocation
    }
  },

  created() {
    this.getLandmarks();
  }
};
</script>

<style>
/* body {
  background-color: #EDEAE5;

} */

.circle {
  /* border-radius: 50%; */
  /* height: 21rem;
  width: 21rem; */
  border-radius: 5px 20px 5px;
  height: 30rem;
  width: 20rem;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
}

.circle:hover {
  
  filter: drop-shadow(9px 9px 9px black);
}

.image:hover {
  height: 520px;
  
  /* height: 75%;
  width: 75%; */
  filter: grayscale(100%) blur(2px);
}

.image {
  height: 500px;
  border-radius: 5px 20px 5px;
  filter: contrast(120%);
}

.title {
  text-decoration: none;
}

.card {
  font-family: "Nanum Gothic", sans-serif;
  font-size: 25px;
}
</style>
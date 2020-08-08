<template >
  <div class="container">
    
    <header>
      <h1>List of Landmarks in Rome</h1>
      <div id="search">
        <label for="name">Where do you want to go?</label>
        <input type="text" class="search-bar" v-model="this.filter.landmarkName" />

      </div>
      <!-- <router-link
        class="itinerary-route"
        v-bind:to="{name: 'itineraries' , params: {id: this.$store.state.user.id}}"
      >
        <i class="fas fa-clipboard-list"></i>
      </router-link> -->
    </header>

    <div class="grid">
      <div
        class="objects container-panel"
        v-for="landmark in this.$store.state.landmarks"
        v-bind:key="landmark.name"
      >
        <div class="object">
          <router-link
            class="title"
            v-bind:to="{name: 'landmarkdetails' 
          , params: {id: landmark.landmarkID}}"
          >
            <!-- {{landmark.name}} -->
            <div class="card">
              <img class="image" v-bind:src="getImageUrl(landmark.img)" />
              {{landmark.name}}
              
            </div>
            <div></div>
          </router-link>
          <!-- <button v-on:click.prevent="getItinerary(this.$store.state.user.user_id)"></button> -->
        </div>
      </div>
    </div>
  </div>
  <!--
<div class="container">

  <header>
    <nav>
      <search>
      </search>

      <itinerary-button>
      </itinerary-button>
    </nav>


  </header>
  <main>

    <cards>


    </cards>


  </main>


</div>

  -->
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      filter: {
        ladmarkName: "",
      },
    };
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then((response) => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
  },
  computed: {
    filterLandmark() {
      let filteredLocation = this.$store.state.landmarks;
      if (this.filter.ladmarkName != "") {
        filteredLocation = filteredLocation.filter((landmark) => {
          landmark.name
            .toLowerCase()
            .includes(this.filter.landmarkName.toLowerCase());
        });
      }
      return filteredLocation;
    },
  },

  created() {
    this.getLandmarks();
  },
};
</script>


<style lang="css" scoped>
.image {
  --size: 400px;
  height: calc(var(--size) * 1.15);
  width: var(--size);
  border-radius: calc(var(--size) * 0.15);
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
  
 
}
.card {
  grid-gap: 10px;
  color: white;
  filter:grayscale(25%);
  font-family: 'Open Sans', sans-serif;
  
}
.card:hover {
  
  text-decoration: underline;
  
  filter: contrast(140%);
  filter: saturate(150%);
  
}

/* body {
  margin: 0;
  font-family: Arial, sans-serif;
  height: 100vh;
  text-align: center;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  display: flex;
  
  grid-template-rows: 100px auto;
} */
.search-bar{
  border:2px ivory;
  border-radius: 10%;
  border-style:inset;
  height:1.5vw;
  

}
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 1rem;
  max-width: 80rem;
  margin: 5rem auto;
  padding: 10 5rem;
}

h1 {
  font-family: "Poiret One", cursive;
  font-size: 5vw;
}
#search {
  font-family: "Poiret One", cursive;
  font-size: 1.5vw;
  font-weight: bold;
}

/* .object {
  display: flex;
  flex-flow: row wrap;
  justify-items: center;
  justify-content: center;
  align-items: center;
}

.image {
  margin: 10px;
} */

.title{
  text-decoration:none;
  font-size: 35px;
}

</style>
<template >
  <div class="container">
    <h1>List of Landmarks in Rome</h1>
    <div id="search">
      <!-- <label for="name">Where do you want to go?</label> -->
      <input type="text" class="search-bar" placeholder="Where do you want to go?" v-model="name" />
      <i class="fas fa-search"></i>
    </div>

    <div class="grid">
      <div
        class="objects container-panel"
        v-for="landmark in filterLandmark"
        v-bind:key="landmark.id"
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
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      name: "",

      itineraryLandmark: {
        landmarkId: 0,
        itineraryId: 0
      },
        
      showListOfItineraries: false
    };
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then(response => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
    // getItinerary(userId) {
    //   LandmarkService.getItinerary(userId).then(response => {
    //     this.$store.commit("SET_ITINERARIES", response.data);
    //   });
    // },
    addLandmarkToIt(id, landID){
      this.itineraryLandmark.itineraryId = id;
      this.itineraryLandmark.landmarkId = landID;
      LandmarkService.addLandmarkToItinerary(landID, this.itineraryLandmark).then(response => {
        if(response.status === 201){
            alert("your landmark has been added");
        }
      })
      .catch(error => {
        if (error.response.status == 404) {
          this.$router.push("/not-found");
        }
      });
  },

  },
  computed: {
    filterLandmark() {
      return this.$store.state.landmarks.filter(landmark => {
        return this.name.toLowerCase() === ""
          ? true
          : landmark.name.toLowerCase().includes(this.name.toLowerCase());
      });
    },

  },

  created() {

    this.getLandmarks();

    // this.getItinerary(this.$store.state.user.id);
  }
};
</script>


<style lang="css" scoped>
.image {
  --size: 400px;
  height: calc(var(--size) * 1.3);
  width: var(--size);
  /* border-radius: calc(var(--size) * 0.15); */
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
}
.card {
  grid-gap: 10px;
  color: white;
  filter: grayscale(25%);
  font-family: "Open Sans", sans-serif;
}
.card:hover {
  text-decoration: underline;

  filter: contrast(140%) saturate(150%)
    drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.475));
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
.search-bar {
  border: 2px solid white;
  border-radius: 10%;

  height: 1.5vw;
  width: 20vw;
  border-radius: var(--rad);

  transition: all var(--dur) var(--bez);
  transition-property: width, border-radius;
  height: 2.5vw;
  background-color: #b4c2c5;
  padding: 10px;
  margin: 20px;

  font-family: "Open Sans", sans-serif;
}
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 1rem;
  max-width: 80rem;
  margin: 5rem auto;
  padding: 10 5rem;
  filter: grayscale(50%);
}

h1 {
  font-family: "Poiret One", cursive;
  font-size: 5vw;
}
#search {
  font-family: "Poiret One", cursive;
  font-size: 1.5vw;
  font-weight: bold;
  color: white;
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

.title {
  text-decoration: none;
  font-size: 35px;
}

</style>
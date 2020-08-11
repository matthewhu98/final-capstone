<template >
  <div class="landmark-explained">
    <link

      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
   
    <div class="page-grid">
      
        <h1 class="title">{{this.$store.state.activeLandmark.name}}</h1>
        <p class="description">{{this.$store.state.activeLandmark.discription}}</p>

        
        <img class="main-image" v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)">
        
        <p class="map"> <iframe v-bind:src="getMap()" width="600" height="650" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></p>

         
          <button class="button-itinerary button"
             v-on:click="showListOfItineraries = !showListOfItineraries">{{showListOfItineraries === true ? "Cancel": "Add to Itineraries"}}</button>
        
              <tr class="itTable" v-show="showListOfItineraries">
                 <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID">
                  <td>{{itinerary.name}}</td>
                <td>
                   <input type="checkbox" v-bind:id="itinerary.itineraryID" v-on:click="addLandmarkToIt(itinerary.itineraryID)"/>
                </td>
                 </div>
               </tr>
       

        
        <!-- <div class= "card-gallery">
            <div class="gallery gallery cf" v-for="singleImg in this.$store.state.activeLandmark.moreImgs" v-bind:key="singleImg.id">
                <img class="single-in-gallery-image" v-bind:src="getImageUrl(singleImg)">
           </div>
        </div> -->
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
        landmarkId: this.landmarkID,
        itineraryId: 0,

      },
      

      showListOfItineraries: false
    };
  },

  methods: {
    getImageUrl(pic) {
      return require(`@/assets/${pic}`);
    },
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    },

    addLandmarkToIt(id) {
      this.itineraryLandmark.itineraryId = id;
      LandmarkService.addLandmarkToItinerary(
        this.landmarkID,
        this.itineraryLandmark
      )
        .then(response => {
          if (response.status === 201) {
            alert("your landmark has been added");

        }
      })
      .catch(error => {
        if (error.response.status == 404) {
          this.$router.push("/not-found");
        }
      });
  },


  getMap(){
    
      return this.$store.state.activeLandmark.mapLink;
    }
    
  // }
  // actionButtonDisabled(){
  //     if(this.itineraryLandmark.itineraryId !== 0){
  //       alert("This Landmark Already Exists In Your Trip ");
  //     }
  //   },
    

  },
  created() {
    LandmarkService.getLandmark(this.landmarkID).then(response => {
      this.$store.commit("SET_ACTIVE_LANDMARK", response.data);
    });
    this.getItinerary(this.$store.state.user.id);
  },
  //     computed: {
  //   backgroundURL: getImageUrl() {
  //     return 'url(this.$store.state.activeLandmark.img)';
  //   }

  // }
};
</script>

<style  lang="css" scoped>
/* body{
  background-image: image;
} */
.page-grid{
  display: grid;
  grid-template-columns: 0.7fr 1fr 1fr 1fr 1fr 0.7fr;
  grid-template-areas:
  ".title title . . ."
  ".main-image main-image map map ."
  ".main-image main-image map map ."
  ".main-image main-image map map ."
  ".main-image main-image description description ."
  ". ITbtn ITbtn          description description ."
  ". . . . . ."
  ". . . . . .";
  grid-gap: 25px;
  
  
}



.main-image {
  height: 70vh;
  width: 100%;
  
  grid-area: main-image;
  border:white solid 10px;
}

.title {
  /* font-family: "Nanum Pen Script", cursive; */
  font-size: 70px;
  grid-area: title;
  /* margin-top: 25px;
  height: 20%; */
}

.description {
  /* font-family: "Nanum Gothic", sans-serif;
  font-size: 25px;
  
  margin: 2rem;
  margin-bottom: 0rem;
  padding-top: 1rem; */
  grid-area: description;
  /* color: black;
  position: relative;
  min-height:500px;
  max-height: 100px;
  line-height: 40px;
  vertical-align:middle; */
  font-size: 25px;
  text-align: left;
  font-weight: bolder;

  /* border: 1px solid saddlebrown; */
  
}

.map{
  grid-area:map;
  
  /* size: 600px; */
  /* margin-top: 100px; */
}

/* .landmark-explained { */
  /* color: black; */
  /* display: flex;
  flex-direction: row;
  justify-content: space-around; */
/* } */

.button-itinerary{
  grid-area: ITbtn;
  margin: 0 50px 50px 50px;
  /* float:right;

  position: absolute;
  right: 10px; */
  /* top: 5px; */
}
.itTable {
  position: absolute;
  right: 20px;
  /* top: 80px; */
}
/* .card-gallery{
grid-area: card-gallery;
} */





/* this is for the gallery */

/* .gallery {
  width: 790px;
  margin: 0 auto;
  padding: 5px;
  background: #333;
}

.gallery {
  position: relative;
  float: left;
  padding: 5px;
}

.gallery {
  width: 250px;
  transition: 0.1s transform;
  transform: translateZ(0); /* hack */
/* }

.gallery :hover {
  z-index: 1; */
/* position:relative; */
/* }

.gallery :hover {
  transform: scale(5, 5);
  transition: 0.3s transform;
}

.cf:before,
.cf:after {
  display: table;
  content: "";
  line-height: 0;
}

.cf:after {
  clear: both;
}

.single-in-gallery-image{
  --size: 100px;
  height: calc(var(--size) * 1.15);
  width: var(--size);
  position: center;
} */

/* h1{
  grid-area: h1;
} */

/* .card {
  grid-gap: 10px;
  color: white;
  filter:grayscale(25%);
  font-family: 'Open Sans', sans-serif;
  grid-area: card;
}
.card:hover {
  
  text-decoration: underline;
  
  filter: contrast(140%);
  filter: saturate(150%);
  
} */
/* .single-in-gallery-image {
  --size: 400px;
  height: calc(var(--size) * 1.15);
  width: var(--size);
  border-radius: calc(var(--size) * 0.15);
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
} */
/* repeat(auto-fill, minmax(20rem, 1fr)); */
/* .grid {
  display: grid;
  grid-template-columns: 
  /* ". h1 h1 h1 h1" */

  /* ". description single-image single-image ."
  repeat(auto-fill, minmax(20rem, 1fr));


  grid-gap: 1rem;
  max-width: 80rem;
  margin: 5rem auto;
  padding: 10 5rem;
}  */
</style>
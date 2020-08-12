import axios from 'axios';

export default {

    list() {
      return axios.get('/landmarks');
    },

    getLandmark(id){
      return axios.get(`/landmarks/${id}`);
    },
    
    getItinerary(userId) {
      return axios.get(`/itineraries/${userId}`);
    },

    createItinerary(itinerary, userId){
      return axios.post(`/itineraries/${userId}`, itinerary);
    },

    addLandmarkToItinerary(landmarkId, itineraryLandmark) {
      return axios.post(`/landmarks/${landmarkId}`, itineraryLandmark);
    },

    getItineraryDetails(itineraryId) {
      return axios.get(`/itinerarydetails/${itineraryId}`);
    },

    deleteItinerary(itineraryId){
      return axios.delete(`/itineraries/${itineraryId}`)
    },

    deleteLandmarkInItinerary(itineraryId, itineraryLandmark){
      return axios.post(`/itinerarydetails/landmark/${itineraryId}`, itineraryLandmark)
    }
    // deleteLandmarkInItinerary(itineraryId, landmarkId){
    //   return axios.delete(`/itinerarydetails/${itineraryId}` , landmarkId)
    // }
  
  }
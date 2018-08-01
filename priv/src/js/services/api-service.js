import axios from 'axios';

const ApiService = axios.create({
  baseURL: '/',
  headers: {
    common: {
      Accept: 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    },
  },
  withCredentials: true,
});

export default ApiService;

import axios from 'axios';

const ApiService = axios.create({
  baseURL: '/',
  headers: {
    common: {
      Accept: 'application/json',
      'X-CSRF-TOKEN': document.head
        .querySelector('meta[name="csrf-token"]')
        .getAttribute('content'),
      'X-Requested-With': 'XMLHttpRequest',
    },
  },
  withCredentials: true,
});

export default ApiService;

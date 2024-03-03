import imba from 'imba/plugin';
import { defineConfig } from 'vite';

export default defineConfig({
	server: {
		port: 3000,
	},
	plugins: [imba()],

	resolve: {
		mainFields: ['browser'],
	},
});

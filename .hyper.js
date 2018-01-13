//
// Hyper Config
//

module.exports = {
	config: {
		updateChannel: 'stable',
		fontSize: 12,
		fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
		cursorShape: 'BLOCK',
		cursorBlink: false,
		padding: '12px',
		shellArgs: ['--login'],
		bell: false,
		copyOnSelect: false,
	},

	plugins: [
		'hyperterm-base-16-ocean',
	],
};

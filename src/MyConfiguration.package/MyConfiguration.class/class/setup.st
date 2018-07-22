setup
setup

| actions |

actions := OrderedCollection new.

actions add: (StartupAction
						name: 'Author'
						code: [ Author fullName: 'IgorDejanovic' ]); 
			add: (StartupAction 
						name: 'Debuger'
						code: [ GTGenericStackDebugger alwaysOpenFullDebugger: true ]);
			add: (StartupAction 
						name: 'Theme'
						code: [PolymorphSystemSettings uiThemeClass: (
								  			PolymorphSystemSettings uiThemeClassChoices asDictionary at:  'Pharo Dark');
								  showDesktopLogo: false]);
			add: (StartupAction
						name: 'Fonts'
						code: [
										StandardFonts defaultFont: (LogicalFont familyName: 'Source Code Pro Regular' 
																				   					pointSize: 13).
										GraphicFontSettings resetAllFontToDefault]);
			add: (StartupAction 
						name: 'GitHub'
						code: [IceCredentialsProvider useCustomSsh: true.
								IceCredentialsProvider sshCredentials
									publicKey: '/home/igor/.ssh/id_rsa_github.pub';
									privateKey: '/home/igor/.ssh/id_rsa_github']).

							
StartupPreferencesLoader default
	addAtStartupInPreferenceVersionFolder: actions named: 'IgorSettings.st'.

StartupPreferencesLoader default executeAtomicItems: actions.
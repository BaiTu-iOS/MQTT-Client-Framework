Pod::Spec.new do |mqttc|
	mqttc.name         = "MQTTClient-BaiTu"
	mqttc.version      = "0.15.5"
	mqttc.summary      = "iOS, macOS and tvOS native ObjectiveC MQTT Client Framework"
	mqttc.homepage     = "https://github.com/BaiTu-iOS/MQTT-Client-Framework.git"
	mqttc.license      = { :type => "EPLv1", :file => "LICENSE" }
	mqttc.author       = { "novastonemedia" => "ios@novastonemedia.com" }
	mqttc.source       = {
		:git => "https://github.com/BaiTu-iOS/MQTT-Client-Framework.git",
		:tag => mqttc.version.to_s,
		:submodules => true
	}

	mqttc.requires_arc = true
	mqttc.platform = :ios, "10.0", :osx, "10.10"
	mqttc.ios.deployment_target = "10.0"
	mqttc.osx.deployment_target = "10.10"
	mqttc.default_subspec = 'BaiTu'
	mqttc.static_framework = true

	mqttc.subspec 'Core' do |core|
		core.dependency 'MQTTClient-BaiTu/Min'
		core.dependency 'MQTTClient-BaiTu/Manager'
	end

	mqttc.subspec 'BaiTu' do |ss|
		ss.dependency 'MQTTClient-BaiTu/MinL'
  		ss.dependency 'MQTTClient-BaiTu/ManagerL'
  		ss.dependency 'MQTTClient-BaiTu/WebsocketL'
	end

	mqttc.subspec 'Min' do |min|
		min.source_files =	"MQTTClient/MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/MQTTClient/GCDTimer.{h,m}"
	end

	mqttc.subspec 'MinL' do |minl|
		minl.dependency 'CocoaLumberjack'

		minl.source_files =	"MQTTClient/MQTTClient/MQTTCFSocketDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTCFSocketTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTCoreDataPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTInMemoryPersistence.{h,m}",
					"MQTTClient/MQTTClient/MQTTLog.{h,m}",
					"MQTTClient/MQTTClient/MQTTStrict.{h,m}",
					"MQTTClient/MQTTClient/MQTTClient.h",
					"MQTTClient/MQTTClient/MQTTMessage.{h,m}",
					"MQTTClient/MQTTClient/MQTTPersistence.h",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyDecoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyEncoder.{h,m}",
					"MQTTClient/MQTTClient/MQTTSSLSecurityPolicyTransport.{h,m}",
					"MQTTClient/MQTTClient/MQTTProperties.{h,m}",
					"MQTTClient/MQTTClient/MQTTSession.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionLegacy.{h,m}",
					"MQTTClient/MQTTClient/MQTTSessionSynchron.{h,m}",
					"MQTTClient/MQTTClient/MQTTTransport.{h,m}",
					"MQTTClient/MQTTClient/GCDTimer.{h,m}"
		minl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end

	mqttc.subspec 'Manager' do |manager|
		manager.source_files =	"MQTTClient/MQTTClient/MQTTSessionManager.{h,m}", 
					"MQTTClient/MQTTClient/ReconnectTimer.{h,m}",
					"MQTTClient/MQTTClient/ForegroundReconnection.{h,m}"
		manager.dependency 'MQTTClient-BaiTu/Min'
	end

	mqttc.subspec 'ManagerL' do |managerl|
		managerl.source_files =	"MQTTClient/MQTTClient/MQTTSessionManager.{h,m}", 
					"MQTTClient/MQTTClient/ReconnectTimer.{h,m}", 
					"MQTTClient/MQTTClient/ForegroundReconnection.{h,m}"
		managerl.dependency 'MQTTClient-BaiTu/MinL'
		managerl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end

	mqttc.subspec 'Websocket' do |ws|
		ws.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		ws.dependency 'SocketRocket'
		ws.dependency 'MQTTClient-BaiTu/Min'
		ws.requires_arc = true
		ws.libraries = "icucore"
	end

	mqttc.subspec 'WebsocketL' do |wsl|
		wsl.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		wsl.dependency 'SocketRocket'
		wsl.dependency 'MQTTClient-BaiTu/MinL'
		wsl.requires_arc = true
		wsl.libraries = "icucore"
		wsl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end
end

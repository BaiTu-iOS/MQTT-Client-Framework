Pod::Spec.new do |mqttc|
	mqttc.name         = "MQTTClientBaiTu"
	mqttc.version      = "0.15.6"
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
		core.dependency 'MQTTClientBaiTu/Min'
		core.dependency 'MQTTClientBaiTu/Manager'
	end

	mqttc.subspec 'BaiTu' do |ss|
		ss.dependency 'MQTTClientBaiTu/MinL'
  		ss.dependency 'MQTTClientBaiTu/ManagerL'
  		ss.dependency 'MQTTClientBaiTu/WebsocketL'
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
		manager.dependency 'MQTTClientBaiTu/Min'
	end

	mqttc.subspec 'ManagerL' do |managerl|
		managerl.source_files =	"MQTTClient/MQTTClient/MQTTSessionManager.{h,m}", 
					"MQTTClient/MQTTClient/ReconnectTimer.{h,m}", 
					"MQTTClient/MQTTClient/ForegroundReconnection.{h,m}"
		managerl.dependency 'MQTTClientBaiTu/MinL'
		managerl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end

	mqttc.subspec 'Websocket' do |ws|
		ws.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		ws.dependency 'SocketRocket'
		ws.dependency 'MQTTClientBaiTu/Min'
		ws.requires_arc = true
		ws.libraries = "icucore"
	end

	mqttc.subspec 'WebsocketL' do |wsl|
		wsl.source_files = "MQTTClient/MQTTClient/MQTTWebsocketTransport/*.{h,m}"
		wsl.dependency 'SocketRocket'
		wsl.dependency 'MQTTClientBaiTu/MinL'
		wsl.requires_arc = true
		wsl.libraries = "icucore"
		wsl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'LUMBERJACK=1' }
	end
end

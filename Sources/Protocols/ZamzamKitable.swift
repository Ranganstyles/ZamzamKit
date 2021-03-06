//
//  ZamzamKitable.swift
//  ZamzamKit
//
//  Created by Basem Emara on 1/29/17.
//  Copyright © 2017 Zamzam. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

public protocol ZamzamKitable {

}

public extension ZamzamKitable {

	/// App's name.
	var appDisplayName: String? {
		// http://stackoverflow.com/questions/28254377/get-app-name-in-swift
		return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
	}
	
	/// App's bundle ID.
	var appBundleID: String? {
		return Bundle.main.bundleIdentifier
	}
	
	/// App's current version.
	var appVersion: String? {
		return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
	}

	/// App current build number.
	var appBuild: String? {
		return Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String
	}
}

// MARK: - Environment
public extension ZamzamKitable {
	
	/// Check if app is running in TestFlight mode.
	var isInTestFlight: Bool {
		// http://stackoverflow.com/questions/12431994/detect-testflight
		return Bundle.main.appStoreReceiptURL?.path.contains("sandboxReceipt") == true
	}

	/// Check if application is running on simulator (read-only).
	var isRunningOnSimulator: Bool {
		// http://stackoverflow.com/questions/24869481/detect-if-app-is-being-built-for-device-or-simulator-in-swift
		#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
			return true
		#else
			return false
		#endif
	}

}

public extension ZamzamKitable {
	
	/// Screen height.
	var screenHeight: CGFloat {
		#if os(iOS) || os(tvOS)
			return UIScreen.main.bounds.height
		#elseif os(watchOS)
			return WKInterfaceDevice.current().screenBounds.height
		#endif
	}
	
	/// Screen width.
	var screenWidth: CGFloat {
		#if os(iOS) || os(tvOS)
			return UIScreen.main.bounds.width
		#elseif os(watchOS)
			return WKInterfaceDevice.current().screenBounds.width
		#endif
	}
}

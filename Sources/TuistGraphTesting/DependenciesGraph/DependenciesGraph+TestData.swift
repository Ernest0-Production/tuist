import Foundation
import TSCBasic
import TuistGraph

extension DependenciesGraph {
    /// A snapshot of `graph.json` file.
    public static var testJson: String {
        """
        {
          "externalDependencies": [
            "ios",
            {
              "RxSwift": [
                {
                  "xcframework": {
                    "platformFilters": [],
                    "path": "/Tuist/Dependencies/Carthage/RxSwift.xcframework",
                    "status": "required"
                  }
                }
              ]
            }
          ],
          "externalProjects": []
        }
        """
    }

    /// A snapshot of `Dependencies.swift` file.
    public static var testDependenciesFile: String {
        """
        import ProjectDescription

        let dependencies = Dependencies(
            carthage: [
                .github(path: "RxSwift/RxSwift", requirement: .exact("5.0.4")),
            ],
            platforms: [.iOS]
        )
        """
    }

    public static func test(
        externalDependencies: [String: [TargetDependency]] = [:],
        externalProjects: [AbsolutePath: Project] = [:]
    ) -> Self {
        .init(externalDependencies: externalDependencies, externalProjects: externalProjects)
    }

    public static func testXCFramework(
        name: String = "Test",
        // swiftlint:disable:next force_try
        path: AbsolutePath = AbsolutePath.root.appending(try! RelativePath(validating: "Test.xcframework")),
        platforms: Set<Platform>,
        status: FrameworkStatus = .required
    ) -> DependenciesGraph {
        let externalDependencies = [name: [TargetDependency.xcframework(path: path, status: status)]]

        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func test(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "Tuist": [
                TargetDependency.project(
                    target: "Tuist",
                    path: packageFolder
                ),
            ],
        ]

        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func aDependency(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "ALibrary": [
                TargetDependency.project(
                    target: "ALibrary",
                    path: packageFolder
                ),
            ],
        ]


        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func anotherDependency(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "AnotherLibrary": [
                TargetDependency.project(
                    target: "AnotherLibrary",
                    path: packageFolder
                ),
            ],
        ]

        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func alamofire(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "Alamofire": [
                TargetDependency.project(
                    target: "Alamofire",
                    path: packageFolder
                ),
            ],
        ]


        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func googleAppMeasurement(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "GoogleAppMeasurement": [
                TargetDependency.project(
                    target: "GoogleAppMeasurementTarget",
                    path: packageFolder
                ),
            ],
            "GoogleAppMeasurementWithoutAdIdSupport": [
                TargetDependency.project(
                    target: "GoogleAppMeasurementWithoutAdIdSupportTarget",
                    path: packageFolder
                ),
            ],
        ]


        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func googleUtilities(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "GULAppDelegateSwizzler": [
                TargetDependency.project(
                    target: "GULAppDelegateSwizzler",
                    path: packageFolder
                ),
            ],
            "GULMethodSwizzler": [
                TargetDependency.project(
                    target: "GULMethodSwizzler",
                    path: packageFolder
                ),
            ],
            "GULNSData": [
                TargetDependency.project(
                    target: "GULNSData",
                    path: packageFolder
                ),
            ],
            "GULNetwork": [
                TargetDependency.project(
                    target: "GULNetwork",
                    path: packageFolder
                ),
            ],
        ]
        

        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }

    public static func nanopb(
        packageFolder: AbsolutePath,
        platforms: Set<Platform>
    ) -> Self {
        let externalDependencies = [
            "nanopb": [
                TargetDependency.project(
                    target: "nanopb",
                    path: packageFolder
                ),
            ],
        ]

        return .init(
            externalDependencies: externalDependencies,
            externalProjects: [:]
        )
    }
}

